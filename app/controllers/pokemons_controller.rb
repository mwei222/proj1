class PokemonsController < ApplicationController
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.update(trainer_id: current_trainer.id)
		redirect_to root_path
	end	

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.update(health: (@pokemon.health - 10))
		if @pokemon.health < 0
			@pokemon.destroy
			end
		redirect_to trainer_path(id: @pokemon.trainer_id)
		
	end
	


	def show
		@pokemon = Pokemon.find(params[:id])
	end

	def create
		@pokemon = Pokemon.new
		if @pokemon.save
			redirect_to trainer_path(id: current_trainer)
		else
			flash[:error] = @pokemon.errors.full_messages.to_sentence
			redirect_to trainer_path
		end

	end

	def new
	end

	def user_params
		params.require(:pokemon).permit(:name)
	end

end
