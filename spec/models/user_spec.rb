require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
  end

  it "should not store a users password" do
    user = User.create(email: 'email@test.com', password: 'password123', password_confirmation: 'password123')

    expect(user).to_not have_attribute(:password)
    expect(user.password_digest).to_not eq('password123')
  end

  it 'will add an api key after creation' do
        user = User.create!(email: 'test@yahoo.com', password: 'password')

        expect(user.api_key).to be_a(String)
        expect(user.api_key.length).to eq(100)
    end
end
