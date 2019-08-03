class Admins::RanksController < ApplicationController

  before_action :authenticate_admin!

  def create
    @rank = Rank.new(rank_params)
    if @rank.save
      flash[:success] = "登録が完了しました"
      redirect_to admins_ranks_path
    else
      @ranks = Rank.all
      render 'index'
    end
  end

  def index
    @rank = Rank.new
    @ranks = Rank.all
  end

  def show
    @rank = Rank.find(params[:id])
  end

  def update
    @rank = Rank.find(params[:id])
    if @rank.update(rank_params)
      flash[:success] = "登録が完了しました"
      redirect_to admins_ranks_path
    else
      render 'show'
    end
  end

  def destroy
    rank = Rank.find(params[:id])
    rank.destroy
    redirect_to admins_ranks_path
  end

  private

  def rank_params
    params.require(:rank).permit(:name)
  end

end
