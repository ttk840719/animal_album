class AnimalsController < ApplicationController
	before_action :find_animal, only: [:show, :edit, :update, :destroy] #use find_animal in these
	skip_before_filter :verify_authenticity_token
	before_action :authenticate_user!, except: [:index, :show] #check if sign in

	def index
		@animal = Animal.all.order("created_at DESC")
	end

	def new
		@animal = current_user.animals.build
	end

	def create
		@animal = current_user.animals.build(animal_params)

		if @animal.save
				redirect_to @animal, notice: "New photo posted!"
		else
			render 'new' #go back to new.html, don't save
		end
	end

	def edit #already find the animal in before_action
	end

	def show #already find the animal in before_action
	end

	def update
		if @animal.update(animal_params)
				redirect_to @animal
		else
			render 'edit'
		end
	end

	def destroy
		@animal.destroy
		redirect_to root_path, notice: "Photo deleted!"
	end


	private

	def find_animal
		@animal = Animal.find(params[:id])
	end

	def animal_params
		params.require(:animal).permit(:title, :description, :image)
	end


end
