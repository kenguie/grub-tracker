class GrubbersController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@grubber = Grubber.new
  end

  def create
  	@grubber = Grubber.new(params.require(:grubber).permit(:email, :mobile, :password))

  	if @grubber.save
  		flash[:notice] = "Let's get to grubbing!"
  		redirect_to root_path
  	else
  		flash[:alert] = "Something went wrong!"
  		render :new
  	end
  end

  def edit
  end
end
