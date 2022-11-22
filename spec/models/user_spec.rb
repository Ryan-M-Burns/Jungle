require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new( 
      last_name: "El'Jonson",
      first_name: "Lion",
      email: "the_rock@caliban.com",
      password_digest: "for the lion!"
    )

    @user.errors.full_messages
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'is not valid without a last name' do
    @user.last_name = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without a first name' do
    @user.first_name = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without an email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without a password' do
    @user.password_digest = nil
    expect(@user).to_not be_valid
  end
 
end
