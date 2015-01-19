class FunpostsController < ApplicationController
  def index
  	@funposts = Funpost.page(params[:page]).per(25)
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
end
