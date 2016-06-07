require 'rails_helper'

describe "Valid Event" do 

  it "is valid with name, rsvp, location, paid_event, price, members, language_id" do
    event = Event.new(
      name: "bypassing", 
      rsvp: false, 
      location: "Hayleeland, 1241 Johnpaul Groves, 22111-5368", 
      paid_event: false, 
      price: "25.45", 
      members: 19, 
      language_id: 9
      )
    expect(event).to be_valid
  end

end