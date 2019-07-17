class Admins::RanksController < ApplicationController

  def create
    rank = Rank.new(rank_params)
    rank.save
    redirect_to admins_ranks_path
  end

  def index
    @rank = Rank.new
    @ranks = Rank.all
  end

  def show
    @rank = Rank.find(params[:id])
  end

  def update
    rank = Rank.find(params[:id])
    rank.update(rank_params)
    redirect_to admins_ranks_path
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
