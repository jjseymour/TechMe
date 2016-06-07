require 'rails_helper'

describe EventsController do

  # WE HAVE TO FIGURE CONTROLLER TESTS WITH AUTH ENABLED: let and before
  
  #let(:user) {User.create(username: "Bromance", password: "password")}
  before(:each) do
    user = User.new(
      username: "Bromano", 
      password: "password1234",
      password_confirmation: "password1234"
      )
    @user = User.find_by(username: "Bromano")
end
  
  describe "GET #index" do
    it "gets the index view" do
      get "index"
      expect(response).to render_template :events # :index
    end
  end

  describe "GET #show" do
    it "gets the show view" do
      get "show"
      expect(response).to render_template :events # :show
    end
  end

end 