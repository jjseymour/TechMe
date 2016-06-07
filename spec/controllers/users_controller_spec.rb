require 'rails_helper'

describe UsersController do
 
  #let(:user) {User.create(username: "Bromance", password: "password", password_confirmation: "password")}
  before :each do
    user = User.new(
      username: "Bromano", 
      password: "password1234",
      password_confirmation: "password1234"
      )
    event = Event.new(
      name: "bypassing", 
      rsvp: false, 
      location: "Hayleeland, 1241 Johnpaul Groves, 22111-5368", 
      paid_event: false, 
      price: "25.45", 
      members: 19, 
      language_id: 9
      )

    it 'visits the users page', :js => true do
     visit '/users'

      within(".form-control") do 
        fill_in('location', with: 'New York')
        check('Ruby')
      end 
    #binding.pry
    #@user = User.find_by(username: "Bromano")
    end 
end
  
  describe "GET Users#show view page" do
    it "gets the users show view after user signed up" do
      get "users"
      expect(response).to render_template :users
    end
  end

end 