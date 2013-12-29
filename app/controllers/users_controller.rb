class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:websites]

  def websites
    @websites = current_user.websites.where("status in (0, 1)")
  end
end
