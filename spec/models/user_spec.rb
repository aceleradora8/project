require 'rails_helper'

describe User, type: :model do
	describe 'user' do
		before :each do
			@user = User.create!(email: "teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
			@user_new = User.new(email: "teste_new@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
			@user_volunteer = User.create!(email: "testevolunteer@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"volunteer")
			@user_admin = User.create!(email: "testeadmin@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"admin")
			@user_notconfirmed = User.create!(email: "testenaoconfirmado@teste.com", password:"123", confirmed: false, auth_token: "esseehmeutoken", role:"admin")
		end
	

		it 'return true if email exists' do
			expect(@user.user_exists?).to be true
		end

		it 'return false if email not exists' do
			expect(@user_new.user_exists?).to be false
		end

		it 'return true if user is volunteer' do
			expect(@user_volunteer.volunteer?).to be true
		end

		it 'return true if user is admin' do
			expect(@user_admin.admin?).to be true
		end

		it 'expect email to be confirmed, returning true' do
			expect(@user_notconfirmed.email_activate).to be true
			expect(@user.confirmed).to be(true)
		end
	end

end
