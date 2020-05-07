require 'rails_helper'
require_relative '../support/home_page'

RSpec.feature 'home page' do
  given(:home_page) { HomePage.new }

  scenario 'guest user visits the home page' do
    home_page.visit_page
    expect(page).to have_content(/set_your_future_logo/)
    expect(page).to have_content(/href="\/Inicia Sesión"/)
    expect(page).to have_content(/href="\/Regístrate"/)
  end
end
