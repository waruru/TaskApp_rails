class BoardsController < ApplicationController
  def index
  end

  def show
    @board = Board.includes(:task_lists, :tasks).find(params[:id])
  end

  def new
  end

  def create
  end
end
