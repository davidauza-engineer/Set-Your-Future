require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  context 'when guest user' do
    before do
      get :home
    end

    it 'renders :home template' do
      expect(response).to render_template(:home)
    end

    it 'displays the right title' do
      expect(response.body).to have_title('Inicio | Set Your Future', exact: true)
    end
  end
end
