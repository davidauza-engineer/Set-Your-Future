require 'rails_helper'

RSpec.describe 'users/new.html.erb', type: :view do
  before do
    @user = User.new
    render
  end

  it 'contains a link to the root path' do
    expect(rendered).to match(%r{href="/"})
  end

  it "contains a 'REGÍSTRATE' title" do
    expect(rendered).to match(/REGÍSTRATE/)
  end

  it 'contains a submit button to create a new user' do
    expect(rendered).to match(/<input type="submit" name="commit" value="Continuar"/)
  end

  it 'contains an input field for the username(Nombre de usuario)' do
    expect(rendered).to match(/<input placeholder="Nombre de usuario"/)
  end

  it 'contains an input field for the email(Correo electrónico' do
    expect(rendered).to match(/<input placeholder="Correo electrónico"/)
  end

  it 'contains an input field for the password(Contraseña)' do
    expect(rendered).to match(/<input placeholder="Contraseña"/)
  end

  it 'contains an input field for the password_confirmation(Confirmar contraseña)' do
    expect(rendered).to match(/<input placeholder="Confirmar contraseña"/)
  end

  it 'displays errors', skip_before: true do
    @user = FactoryBot.build(:user, username: '')
    # rubocop:disable RSpec/InstanceVariable
    @user.valid?
    # rubocop:enable RSpec/InstanceVariable
    render
    expect(rendered).to match(/El formulario contiene \d? errores:/)
  end
end
