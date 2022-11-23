require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create( 
      last_name: "El'Jonson",
      first_name: "Lion",
      email: "the_rock@caliban.com",
      password: "for the lion!",
      password_confirmation: "for the lion!"
    )
  end
  # happy path test
  it 'is valid with valid attributes' do
    expect(@user).to be_valid
    expect(@user.errors.full_messages.any?).to be false
  end

  describe "Validations" do
    it 'is not valid without a last name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include ("Last name can't be blank")
    end
  
    it 'is not valid without a first name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end
  
    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
  
    it 'is not valid without a password' do
      @user.password_digest = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end
  end

  describe ".authenticate_with_credentials" do

    it 'is not valid if email is already in database (case insensitive)' do
      @user2 = User.create(
        last_name: "Cypher",
        first_name: "Cypher",
        email: "The_Rock@CaliBan.com",
        password: "Cypher",
        password_confirmation: "Cypher"
      )
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include ("Email has already been taken")
    end
  end
end
