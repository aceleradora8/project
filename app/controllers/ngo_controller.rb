class NgoController < ApplicationController

	def new
		@ngo = NgoController.new
	end

	
	def index
	end

	def create
		@ngo = Ngo.new(ngo_params)
		if(request.post? and @ngo.save)
			format.html { redirect_to @ngo.index, notice: "ONG cadastrada com sucesso" }
		else
			format.html { render :new }
		end
	end

	private
		def ngo_params
			params.require(:ngo).permit(:name, :description, :address, :email)
		end

end
