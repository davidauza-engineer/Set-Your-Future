require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe 'GET /registrate' do
    before do
      get :new
    end

    it 'renders :new template' do
      expect(response).to render_template(:new)
    end

    it 'assigns a new User to @user' do
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'displays the right title' do
      expect(response.body).to have_title('Regístrate | Set Your Future', exact: true)
    end
  end

  describe 'POST /create' do
    context 'with valid data' do
      before do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
      end

      it 'creates a new User with provided params' do
        expect(assigns(:user)).to be_an_instance_of(User)
      end

      it 'creates a new User in the database', skip_before: true do
        expect do
          post :create, params: { user: FactoryBot.attributes_for(:user) }
        end.to change(User, :count).by(1)
      end

      it "redirects to the user's profile" do
        expect(response).to redirect_to("/profile/#{controller.user.id}")
      end

      it 'displays a message confirming that the user was created' do
        expect(flash[:notice]).to match(/Gracias por registrarte/)
      end
    end

    context 'with invalid data' do
      before do
        post :create, params: { user: FactoryBot.attributes_for(:user, email: '') }
      end

      it 'assigns a new User to @user' do
        expect(assigns(:user)).to be_a_new(User)
      end

      it 'renders :new template' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET /show' do
    let(:user) { FactoryBot.create(:user) }

    before do
      get :show, params: { id: user.id }
    end

    it 'renders :show template' do
      expect(response).to render_template(:show)
    end

    it 'displays the right title' do
      expect(response.body).to have_title("#{user.username} | Set Your Future")
    end

    it 'assigns the right User to @user' do
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'user_params private method' do
    before do
      post :create, params: { user: FactoryBot.attributes_for(:user, id: 182) }
    end

    it 'filters unpermitted parameters' do
      expect(controller.send(:user_params)).not_to include(:id)
    end

    it 'permits username attribute' do
      expect(controller.send(:user_params)).to include(:username)
    end

    it 'permits email attribute' do
      expect(controller.send(:user_params)).to include(:email)
    end

    it 'permits password attribute' do
      expect(controller.send(:user_params)).to include(:password)
    end

    it 'permits password_confirmation attribute' do
      expect(controller.send(:user_params)).to include(:password_confirmation)
    end
  end
end
