class HomeController < ApplicationController
  def index
    @websites = Website.all
  end

  def about
  end

  def contact
  end

  def help
  end
end
