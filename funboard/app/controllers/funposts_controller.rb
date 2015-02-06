class FunpostsController < ApplicationController
  def index
  	@funposts = Funpost.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
  	@funpost = Funpost.new
  end

  def create
  	@funpost = Funpost.new(params.require(:funpost).permit(:title, :description, :url))
  	if @funpost.save
  		redirect_to root_path
  	else
  		render "new"
  	end
  end

  def show
    @funpost = Funpost.find(params[:id])
  end
end
