require 'rails_helper'

describe "Valid Job" do 

  it "is valid with name, title, company, position, salary, date_posted, description, language_id, location, apply" do
    job = Job.new(
      title: "Senior Creative Associate", 
      company: "Gislason Group", position: "facilis", 
      salary: "88821", 
      date_posted: "2016-06-02", 
      description: "Vice tofu biodiesel synth taxidermy kickstarter po...", 
      language_id: 4, 
      location: nil, 
      apply: nil
      )
    expect(job).to be_valid
  end

end