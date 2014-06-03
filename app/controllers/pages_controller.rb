class PagesController < ApplicationController
  before_action :authenticate_user!

  def user
    @user = current_user
    @entries = Entry.where(:user_id => current_user)

  end

  def contact

  end

end
