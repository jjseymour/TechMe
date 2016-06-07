require 'rails_helper'

describe "Valid User" do 
  
  it "is valid with username, password and password confirmation" do
    user = User.new(
      username: "Bromano", 
      password: "password1234",
      password_confirmation: "password1234"
      )
    expect(user).to be_valid
  end

  it "is invalid without a username" do 
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).not_to include("can't be blank")
  end

  it "is invalid without a password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid without a password confirmation" do
    user = User.new(password_confirmation: nil)
    user.valid?
    expect(user.errors[:password_confirmation]).not_to include("can't be blank")
  end

  it "is invalid if password and confirmation don't match" do
    user = User.new(
      username: 'Broderen',
      password: 'password',
      password_confirmation: 'password1234')
    user.valid?
    expect(user.errors[:password_confirmation]).not_to include("passwords don't match, brofasa")
  end

  it "is invalid with a duplicate username" do
    User.create(
      username: 'Bro',
      password: 'password1234',
      password_confirmation: 'password1234'
      )
    user = User.new(
      username: 'Bro', 
      password: 'password1234',
      password_confirmation: 'password1234'
      )
    user.valid?
    expect(user.errors[:username]).not_to include("has already been taken, bro")
  end

end

