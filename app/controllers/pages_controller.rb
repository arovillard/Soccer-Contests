class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:contact]

  def user
    @user = current_user
    @winners = Winner.where(:user_id => current_user)
    @winners_id = Winner.where(:user_id => current_user).pluck(:entry_id)
    @entries = Entry.where(:user_id => current_user).reverse

  end

  def contact

  end

end
