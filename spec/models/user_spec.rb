require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'before_save actions' do
    let(:user) { FactoryBot.create(:user, username: 'Test user', email: 'TEST@examplE.com') }

    it "downcases the user's email" do
      expect(user.email).to eq('test@example.com')
    end
  end

  describe 'validations' do
    describe 'username' do
      it { is_expected.to validate_length_of(:username).is_at_least(2) }

      it { is_expected.to validate_length_of(:username).is_at_most(50) }

      it { is_expected.to validate_presence_of(:username) }

      it "doesn't allow two users with the same name (case insensitive)" do
        FactoryBot.create(:user, username: 'cooluser')
        user = FactoryBot.build(:user, username: 'CoolUser')
        expect(user).not_to be_valid
      end
    end

    describe 'email' do
      let(:user) { FactoryBot.build(:user, email: 'email@example.com') }

      it 'validates an user with an email that matches an email REGEX' do
        expect(user).to be_valid
      end

      it "doesn't validate an user with an email that doesn't match an email REGEX" do
        user = FactoryBot.build(:user, email: 'email.com')
        expect(user).not_to be_valid
      end

      it { is_expected.to validate_length_of(:email).is_at_least(5) }

      it { is_expected.to validate_length_of(:email).is_at_most(50) }

      it { is_expected.to validate_presence_of(:email) }

      it "doesn't allow two users with the same email" do
        user.save
        new_user = FactoryBot.build(:user, email: 'email@Example.com')
        expect(new_user).not_to be_valid
      end
    end

    describe 'password' do
      it { is_expected.to validate_presence_of(:password) }

      it { is_expected.to validate_length_of(:password).is_at_least(6) }

      it { is_expected.to validate_length_of(:password).is_at_most(72) }
    end

    describe 'password_confirmation' do
      it { is_expected.to validate_presence_of(:password_confirmation) }

      it { is_expected.to validate_length_of(:password_confirmation).is_at_least(6) }

      it { is_expected.to validate_length_of(:password_confirmation).is_at_most(72) }
    end
  end
end
