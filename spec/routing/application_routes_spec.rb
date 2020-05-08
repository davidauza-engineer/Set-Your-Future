require 'rails_helper'

RSpec.describe 'Application Routes', type: :routing do
  it 'successfully routes root to static_pages#home' do
    expect(get: root_path).to route_to(controller: 'static_pages', action: 'home')
  end

  it 'successfully routes /registrate to users#new' do
    expect(get: '/registrate').to route_to(controller: 'users', action: 'new')
  end
end
