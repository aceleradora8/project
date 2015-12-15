require 'rails_helper'

describe User, type: :model do
	describe 'user' do
		before :each do
			@user = User.create!(email: "teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
			@user_new = User.new(email: "teste_new@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
		end
	

		it 'return true if email exists' do
			expect(@user.user_exists?).to be true
		end

		it 'return false if email not exists' do
			expect(@user_new.user_exists?).to be false
		end

	end

end
