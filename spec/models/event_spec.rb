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

  it "is invalid without a name" do 
    event = Event.new(name: nil)
    event.valid?
    expect(event.errors[:event])
  end

  it "is invalid without a rsvp" do 
    event = Event.new(rsvp: nil)
    event.valid?
    expect(event.errors[:event])
  end

  it "is invalid without a location" do 
    event = Event.new(location: nil)
    event.valid?
    expect(event.errors[:event])
  end

  it "is invalid without a paid_event" do 
    event = Event.new(paid_event: nil)
    event.valid?
    expect(event.errors[:event])
  end

  it "is invalid without a price" do 
    event = Event.new(price: nil)
    event.valid?
    expect(event.errors[:event])
  end

  it "is invalid without a members" do 
    event = Event.new(members: nil)
    event.valid?
    expect(event.errors[:event])
  end

end