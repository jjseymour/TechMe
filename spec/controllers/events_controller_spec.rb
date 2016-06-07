require 'rails_helper'

describe EventsController do
 
  #let(:user) {User.create(username: "Bromance", password: "password")}
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

    fill_in('location', with: 'New York')
    fill_in('language_selected', with: 'Ruby')

    #binding.pry
    #@user = User.find_by(username: "Bromano")
end
  
  describe "GET #index" do
    it "gets the events view after user signed up" do
      get "events"
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