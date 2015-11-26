class NgosController < ApplicationController

	def new
		@ngo = Ngo.new
		@ngo.build_address
	end


	def show
	end

	def create
		@ngo = Ngo.new(ngo_params)
		respond_to do |format|
			if(@ngo.save)
				format.html { redirect_to "/ngos/#{@ngo.id}", notice: "ONG cadastrada com sucesso" }
			else
				puts "Erro"
			end
		end
	end

	private
		def ngo_params
			params.require(:ngo).permit(:name, :description, :email, :address_attributes => [:address, :cep, :complement, :state, :city, :country, :neighbourhood])
		end
	end
