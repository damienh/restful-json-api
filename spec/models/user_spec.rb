require 'rails_helper'

describe User do
  it 'has a valid factory' do
    FactoryGirl.create(:user)
    expect(:user).respond_to?(:valid)
  end

  it 'is invalid without a username' do
    expect(FactoryGirl.build(:user, username: nil)).to_not be_valid
  end

  it 'is invalid without a email' do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end

  it 'is invalid without a password' do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end
end
