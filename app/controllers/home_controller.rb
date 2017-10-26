class HomeController < ApplicationController

  def index
    @users = User.all
    @articles = Article.limit(4)
  end
end
