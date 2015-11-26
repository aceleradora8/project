class NgosController < ApplicationController

	def new
		@ngo = Ngo.new
		@ngo.build_address
	end


	def show
	end
	def create
		@ngo = Ngo.new(ngo_params)
			if(@ngo.save)
				format.html { redirect_to @ngo.show, notice: "ONG cadastrada com sucesso" }
			else
				puts "Erro"
			end
	end

	private
		def ngo_params
			params.require(:ngo).permit(:name, :description, :email, :address_attributes => [:address, :cep, :complement, :state, :city, :country])
		end
	end
