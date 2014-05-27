ActiveAdmin.register Game do

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :contest_id, :team_a_name, :team_b_name, :team_a_result, :team_b_result, :game_date, :group, :active
  #
  # or
  #
  batch_action :active do |ids|
    Game.find(ids).each do |game|
      game.update :active => true
    end
    redirect_to collection_path, alert: "The games have been activated."
  end

  batch_action :disable do |ids|
    Game.find(ids).each do |game|
      game.update :active => false
    end
    redirect_to collection_path, alert: "The games have been disabled."
  end

  controller do
    def update(options={}, &block)
      # This is taken from the active_admin code
      super do |success, failure|
        block.call(success, failure) if block
        failure.html { render :edit }

        if @game.team_a_result != nil && @game.team_b_result != nil
          current_winners = [0]
          current_winners += Winner.where("game_id = ?", @game.id).pluck(:user_id)
          new_winners = Entry.where("game_id = ? and team_a_score = ? and team_b_score = ? and user_id not in (?)",
                      @game.id, @game.team_a_result, @game.team_b_result, current_winners)
          new_winners.each do |winner|
            taken = [0]
            raffle_number = 0
            taken += Game.find(winner.game_id).winners.pluck(:raffle_number)
            (raffle_number = rand(1..1000)) until taken.include?(raffle_number) == false
            var = Winner.new(:user_id => winner.user_id, :entry_id => winner.id, :game_id => winner.game_id, :raffle_number => raffle_number)
            var.save
            @raffle_number = raffle_number
            @user = User.find(winner.user_id)
            WinnerMailer.winner_email_template(@user, @game, @raffle_number).deliver
          end
        end
      end
    end
  end
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
