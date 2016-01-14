require 'rails_helper'
require 'capybara/rspec'

describe OpportunitiesController, type: :controller do
  describe '#index' do
      before :each do
        @address_poa = Address.create!(city:"POA", zipcode: "5", address:"rua")
        @address_viamao = Address.create!(city:"Viamão", zipcode: "5", address:"rua")
      	ngo = Ngo.create!(address_id: @address_poa.id, phone1: "1234", name:"nome", description: "Qualquer coisa")
      	@cause_animal = Cause.create!(name:"Animal")
        @cause_health = Cause.create!(name:"health")
        start_date = "2015-03-03"
        finish_date = "2015-04-03"
      	@opportunity1 = Opportunity.create!(title: 'Opportunity1', description: "Qualquer coisa", address_id: @address_poa.id, ngo_id: ngo.id, start_date: start_date, finish_date: finish_date)
      	@opportunity1.causes.push(@cause_animal)
        @opportunity2 = Opportunity.create!(title: 'Opportunity2', description: "Qualquer coisa", address_id: @address_viamao.id, ngo_id: ngo.id, start_date: start_date, finish_date: finish_date)
        @opportunity2.causes.push(@cause_health)
        @controller = OpportunitiesController.new
      end

      it 'returns all opportunities when text_search is nil' do
        get :index, text_search: nil

        expect(assigns(:opportunity_search)).to match_array([@opportunity1,@opportunity2])
      end

      it 'returns all opportunities when text_search is empty' do
        get :index, text_search: ''

        expect(assigns(:opportunity_search)).to match_array([@opportunity1,@opportunity2])
      end

      it 'returns the opportunity when text_search matches the title' do
        get :index, text_search: 'Opportunity1'

        expect(assigns(:opportunity_search)).to match_array([@opportunity1])
      end

      it 'returns Viamãos and healths opportunities when city is Viamão and cause is health' do
        xhr :get, :index, {cities: [@address_viamao.city], causes:[@cause_health]}
        expect(assigns(:opportunities_result)).to match_array([@opportunity2])
      end

      it 'returns Animals opportunities when cause is Animal' do
        xhr :get, :index, {causes: [@cause_animal.id]}
        expect(assigns(:opportunities_result)).to match_array([@opportunity1])
      end

      it 'returns POAs opportunities when city is POA' do
        xhr :get, :index, {cities: [@address_poa.city]}
        expect(assigns(:opportunities_result)).to match_array([@opportunity1])
      end
  end

  describe '#new' do
    before :each do
        @address_poa = Address.create!(city:"POA", zipcode: "5", address:"rua")
        @user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
        @ngo = Ngo.create!(address_id: @address_poa.id, phone1: "1234", name:"nome", description: "Qualquer coisa",user_id:@user.id)
      end

      it 'expect @opportunity to be a instance of Opportunity' do
        cookies[:auth_token] = @ngo.user.auth_token
        get :new
        expect(assigns(:opportunity)).to be_a_new(Opportunity)
      end
  end

  describe '#create' do
    before :each do
        @address_poa = Address.create!(city:"POA", zipcode: "5", address:"rua")
        @user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
        @cause_animal = Cause.create!(name:"Animal")
        @ngo = Ngo.create!(address_id: @address_poa.id, phone1: "1234", name:"nome", description: "Qualquer coisa",user_id:@user.id)
        cookies[:auth_token] = @ngo.user.auth_token
      end

      it 'expect redirect_to opportunity if success' do
        post :create, {opportunity: {
          title: 'Oportunidade32',
          description: 'qualquercoisaai',
          address_attributes: {address:"end qlqrcoisa", zipcode:"66666-333", complement:"atualizado", state:"UP", city:"Atual", country:"Brasil", neighborhood:"Atualizado" },
          ngo_id: @ngo.id,
          cause_id: @cause_animal.id,
          start_date: "2015-03-03",
          finish_date: "2015-04-03"
          }
        }
        this_opportunity = Opportunity.last.id
        expect(response).to redirect_to("/opportunities/#{this_opportunity}")
      end

      it 'expect render new if something goes wrong' do
        post :create, {opportunity: {
          title: 'Oportunidade32',
          description: 'qualquercoisaai',
          cause_id: @cause_animal.id,
          start_date: "2015-03-03",
          finish_date: "2015-04-03"
          }
        }
          expect(response).to render_template("new")
      end


      ## ISN'T WORKING :(
      it 'expect start_date and finish_date to be nil if recurrent = 1' do
          post :create, opportunity: {
          title: 'Oportunidade32',
          description: 'qualquercoisaai',
          address_attributes: {address:"end qlqrcoisa", zipcode:"66666-333", complement:"atualizado", state:"UP", city:"Atual", country:"Brasil", neighborhood:"Atualizado" },
          ngo_id: @ngo.id,
          cause_id: @cause_animal.id,
          recurrent: "1"
          }
        expect(assigns(:opportunity).start_date).to eq(nil)
        expect(assigns(:opportunity).finish_date).to eq(nil)
    end
  end

  describe '#edit' do
    before :each do
        @address_poa = Address.create!(city:"POA", zipcode: "5", address:"rua")
        @user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
        @cause_animal = Cause.create!(name:"Animal")
        @ngo = Ngo.create!(address_id: @address_poa.id, phone1: "1234", name:"nome", description: "Qualquer coisa",user_id:@user.id)
        start_date = "2015-03-03"
        finish_date = "2015-04-03"
        @opportunity1 = Opportunity.create!(title: 'Opportunity1', description: "Qualquer coisa", address_id: @address_poa.id, ngo_id: @ngo.id, start_date: start_date, finish_date: finish_date)
        @opportunity1.causes.push(@cause_animal)
        cookies[:auth_token] = @ngo.user.auth_token
    end

    #TÁ TESTANDO O SET_OPPORTUNITY, NÃO O EDIT
    it 'expect opportunity to be equals a opportunity passed by params' do
      get :edit, id: @opportunity1.id
      expect(assigns(:opportunity)).to eq(@opportunity1)
    end

    it 'expect to be redirect to /404 when passing a opportunity that doesnt exists' do
      get :edit, id: -30
      expect(response).to redirect_to("/404")
    end
  end

  describe '#update' do
    before :each do
        @address_poa = Address.create!(city:"POA", zipcode: "5", address:"rua")
        @user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
        @cause_animal = Cause.create!(name:"Animal")
        @ngo = Ngo.create!(address_id: @address_poa.id, phone1: "1234", name:"nome", description: "Qualquer coisa",user_id:@user.id)
        @start_date = "2015-03-03"
        @finish_date = "2015-04-03"
        @opportunity1 = Opportunity.create!(title: 'Opportunity1', description: "Qualquer coisa", address_id: @address_poa.id, ngo_id: @ngo.id, start_date: @start_date, finish_date: @finish_date)
        @opportunity1.causes.push(@cause_animal)
        cookies[:auth_token] = @ngo.user.auth_token
    end

    it 'redirect to opportunity if update was a success' do
      put :update, {
        id: @opportunity1.id, opportunity:
        {
          title: 'Opportunitdade EE', description: "Qualquer coisa", address_id: @address_poa.id, ngo_id: @ngo.id, cause_id: @cause_animal.id, start_date: @start_date, finish_date: @finish_date
        }
      }
      expect(response).to redirect_to(@opportunity1)
    end

    it 'render edit if anything goes wrong' do
      put :update, {
        id: @opportunity1.id, opportunity:
        {
          title: nil, description: "Qualquer coisa", address_id: @address_poa.id, ngo_id: @ngo.id, cause_id: @cause_animal.id, start_date: @start_date, finish_date: @finish_date
        }
      }
      expect(response).to render_template("edit")
    end
  end

    describe '#destroy' do
      before :each do
        @address_poa = Address.create!(city:"POA", zipcode: "5", address:"rua")
        @user = User.create!(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
        @cause_animal = Cause.create!(name:"Animal")
        @ngo = Ngo.create!(address_id: @address_poa.id, phone1: "1234", name:"nome", description: "Qualquer coisa",user_id:@user.id)
        @start_date = "2015-03-03"
        @finish_date = "2015-04-03"
        @opportunity1 = Opportunity.create!(title: 'Opportunity1', description: "Qualquer coisa", address_id: @address_poa.id, ngo_id: @ngo.id, start_date: @start_date, finish_date: @finish_date)
        @opportunity1.causes.push(@cause_animal)
        cookies[:auth_token] = @ngo.user.auth_token
    end

    it 'return success when Opportunity is deleted' do
      delete :destroy, id: @opportunity1.id
      expect(flash[:notice]).to eq("A oportunidade #{@opportunity1.title} foi removida com sucesso")
    end
  end
end
