class TasksController < ApplicationController
  def index
    @genre = Genre.find(params[:genre_id])
  end
end
