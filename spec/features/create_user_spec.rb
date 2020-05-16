require 'rails_helper'
require_relative '../support/sign_up_page'

RSpec.feature 'create new user' do
  given(:sign_up_page) { SignUpPage.new }
  given(:user) { FactoryBot.build(:user) }

  scenario 'guest user registers to the application' do
    sign_up_page.visit_page.register_as(user)
    expect(page).to have_title("#{user.id} | Set Your Future")
    expect(page).to have_content("Gracias por registrarte #{user.username}")
  end
end
