class PortfoliosController < ApplicationController

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new portfolio_params
    if @portfolio.save
      redirect_to root_path, notice: "Portfolio adicionado!"
    else
      render action: :new
    end

  end

  def edit
    @portfolio = Portfolio.find params[:id]
  end

  def update
    @portfolio = Portfolio.find params[:id]
    if @portfolio.update portfolio_params
      redirect_to root_path, notice: "#{@portfolio.title} foi atualizado!"
    else
      render action: :edit
    end
  end

  def destroy
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle,
    :description, :client_name, :banner)
  end
end
