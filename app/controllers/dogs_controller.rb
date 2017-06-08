class DogsController < ApplicationController
before_action :set_dog, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = Dog.all 
  end

  def new
    @dog = Dog.new
  end

def create
  @dog = Dog.new(dog_params)

  if @dog.save
    redirect_to dogs_url, notice: "Successfully saved"


  else 
    flash.now[:notice] = "Something went wrong.  We couldn't save your dog."
    render :new 

  end
 end

 def show
   # @dog = Dog.find(params[:id])

 end
 


def edit
  # set_dog
  
end


def update
  # set_dog

 if @dog.update(dog_params)
    redirect_to dogs_url, notice: "Successfully updated!"

  else 
    flash.now[:notice] = "Something went wrong.  Try again."
    render :edit
    
  end
end


def destroy
  # set_dog


  if @dog.destroy
    redirect_to dogs_url, notice: "Successfully deleted."
  else 
    redirect_to dogs_url, notice: "Could not delete dog."
  end 
end





 private


 def dog_params
  params.require(:dog).permit(:name, :age, :breed, :owner)
 # : means symbol??
 end


def set_dog
    @dog = Dog.find(params[:id])  
end



end
