class FunpostsController < ApplicationController
  def index
    if params[:tag]
      @funposts = Funpost.tagged_with(params[:tag]).order(created_at: :desc).page(params[:page]).per(8)
    else
  	 @funposts = Funpost.order(created_at: :desc).page(params[:page]).per(5)
    end
  end

  def new
  	@funpost = Funpost.new
  end

  def create
  	@funpost = Funpost.new(params.require(:funpost).permit(:title, :description, :all_tags, :url))
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
