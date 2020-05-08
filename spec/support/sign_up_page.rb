class SignUpPage
  include Capybara::DSL

  def visit_page
    visit('/registrate')
    self
  end

  def register_as(user)
    fill_in('Nombre de usuario', with: user.username)
    fill_in('Correo electrónico', with: user.email)
    fill_in('Contraseña', with: user.password)
    fill_in('Confirmar contraseña', with: user.password)
    click_on('Regístrate')
    self
  end

end
