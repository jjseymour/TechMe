require 'rails_helper'

describe UsersController do
 
  #let(:user) {User.create(username: "Bromance", password: "password", password_confirmation: "password")}
  before :each do
    visit "/"
    
    user = User.create(
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

    click_link('Login')
    #within("form#new_user.new_user") do 
      fill_in('Username', with: 'Bromano')
      fill_in('Password', with: 'password1234')
      fill_in('Password confirmation', with: 'password1234')
    #end 
    #it 'visits the users page', :js => true do
     visit "/users/#{user.id}"

      within("#event_location") do 
        fill_in('location', with: 'New York')
        check('Ruby')
      end 
    #@user = User.find_by(username: "Bromano")
    #end 
end
  
  describe "GET Users#show view page" do
    it "gets the users show view after user signed up" do
      get "users"
      expect(response).to render_template :users
    end
  end

end 