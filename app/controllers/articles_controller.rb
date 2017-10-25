class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params
    @article.user = current_user
    if @article.save
      redirect_to root_path, notice: "Artigo salvo com sucesso!"
    else
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :subtitle, :user, :description, :photo, :body, :photo_file_name)
  end
end
