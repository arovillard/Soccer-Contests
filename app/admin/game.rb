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
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
