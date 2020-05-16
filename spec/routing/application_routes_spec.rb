require 'rails_helper'

RSpec.describe 'Application Routes', type: :routing do

  # root
  it 'successfully routes root to static_pages#home' do
    expect(get: root_path).to route_to(controller: 'static_pages', action: 'home')
  end

  # users
  it 'successfully routes get /users to users#index' do
    expect(get: '/users').to route_to(controller: 'users', action: 'index')
  end

  it 'successfully routes get /registrate to users#new' do
    expect(get: '/registrate').to route_to(controller: 'users', action: 'new')
  end

  it 'successfully routes get /users/new to users#new' do
    expect(get: '/users/new').to route_to(controller: 'users', action: 'new')
  end

  it 'successfully routes post /registrate to users#create' do
    expect(post: '/registrate').to route_to(controller: 'users', action: 'create')
  end

  it 'successfully routes post /users to users#create' do
    expect(post: '/users').to route_to(controller: 'users', action: 'create')
  end

  it 'successfully routes get /profile to users#show' do
    expect(get: '/profile/1').to route_to(controller: 'users', action: 'show', id: '1')
  end

  it 'successfully routes get /users/:id to users#show' do
    expect(get: '/users/1').to route_to(controller: 'users', action: 'show', id: '1')
  end
end
