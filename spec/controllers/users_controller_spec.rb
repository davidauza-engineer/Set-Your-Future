require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET /registrate' do
    it 'renders :new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
