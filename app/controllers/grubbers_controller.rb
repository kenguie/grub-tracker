class GrubbersController < ApplicationController

  def message
  	message = params[:body]
  	#send messages!
    Grubber.email_grubbers(message)
    Grubber.text_grubbers(message)
  end

  def sent
  end

  def show
  end

  def new
  	@grubber = Grubber.new
  end

  def create
  	@grubber = Grubber.new(params.require(:grubber).permit(:email, :mobile, :password))

  	#configure_new_grubber sets additional attributes
  	if @grubber.save
  		flash[:notice] = "Let's get to grubbing!"
  		redirect_to message_path
  	else
  		flash[:alert] = "Something went wrong!"
  		render :new
  	end
  end

  def edit
    @grubber = Grubber.find(params[:id])
  end
  
end
