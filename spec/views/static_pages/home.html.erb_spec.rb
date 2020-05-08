require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", type: :view do
  before do
    render
  end

  it 'displays the company logo' do
    expect(rendered).to match(/set_your_future_logo/)
  end

  it 'displays the company name' do
    expect(rendered).to match(/Set Your Future/)
  end

  it 'displays the app name' do
    expect(rendered).to match(/Bilingual Memes!/)
  end

  it 'contains a link to inicia-sesion' do
    expect(rendered).to match(%r{href="/inicia-sesion"})
  end

  it 'contains a link to registrate' do
    expect(rendered).to match(%r{href="/registrate"})
  end
end
