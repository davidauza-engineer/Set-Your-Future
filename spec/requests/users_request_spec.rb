require 'rails_helper'

RSpec.describe 'Users', type: :request do

  describe 'GET /registrate' do
    it 'returns http success' do
      get '/registrate'
      expect(response).to have_http_status(:success)
    end
  end

end
