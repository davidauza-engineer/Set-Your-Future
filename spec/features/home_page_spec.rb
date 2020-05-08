require 'rails_helper'
require_relative '../support/home_page'

RSpec.feature 'home page' do
  given(:home_page) { HomePage.new }

  scenario 'guest user visits the home page' do
    home_page.visit_page
    expect(page.find('#home-logo')['src']).to have_content(/set_your_future_logo/)
    expect(page).to have_content('Set Your Future')
    expect(page).to have_content('Bilingual Memes!')
    expect(page).to have_selector(:link, 'INICIA SESIÓN')
    expect(page).to have_content(:link, 'REGÍSTRATE')
  end
end
