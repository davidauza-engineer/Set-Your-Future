require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :view do
  before do
    @user = FactoryBot.build(:user)
  end

  it 'displays a notices' do
    flash[:notice] = 'Notice'
    render
    expect(rendered).to match(/Notice/)
  end

  it 'displays a alerts' do
    flash[:alert] = 'Alert'
    render
    expect(rendered).to match(/Alert/)
  end
end