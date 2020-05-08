require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  context 'when guest user' do
    it 'renders :home template' do
      get :home
      expect(response).to render_template(:home)
    end
  end
end
