class HomeController < ApplicationController
  def index
    @websites = Website.published
  end

  def about
  end

  def contact
  end

  def help
  end
end
