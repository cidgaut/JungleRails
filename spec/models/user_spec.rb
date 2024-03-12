require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do
      @user = User.new(
        first_name: 'Test',
        last_name: 'Test',
        email: 'test@test.com',
        password: '123456789',
        password_confirmation: '123456789'
      )
      @user.save
    end



    it 'saves successfully when all fields are set' do
      expect(@user.save).to be true
    end


    it 'requires a first name' do
      @user.first_name = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'requires a last name' do
      @user.last_name = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'requires an email' do
      @user.email = nil
      expect(@user.save).to be false
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'requires passwords to match' do
      @user.password_confirmation = 'mismatched_password'
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'blank password validation' do
      @user.password = nil
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'requires a password with a minimum length of 8 characters' do
      @user.password = nil
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end



  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new(
        first_name: 'Test',
        last_name: 'Test',
        email: 'test@test.com',
        password: '123456789',
        password_confirmation: '123456789')
        @user.save
    end




    it 'returns the user if authentication succeeds' do
      authenticated_user = User.authenticate_with_credentials('test@test.com', '123456789')
      puts authenticated_user
      expect(authenticated_user).to eq(@user)
    end

    it 'returns nil if authentication fails' do
      authenticated_user = User.authenticate_with_credentials('test@test.com', 'differentpassword')
      expect(authenticated_user).to be_nil
    end

    it 'removes spaces before and after email' do
      authenticated_user = User.authenticate_with_credentials('  test@test.com  ', '123456789')
      expect(authenticated_user).to eq(@user)
    end

    it 'ignores case sensitivity' do
      authenticated_user = User.authenticate_with_credentials('TEST@test.com', '123456789')
      expect(authenticated_user).to eq(@user)
    end

  end
end
