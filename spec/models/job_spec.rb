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
      location: "Chicago", 
      apply: nil
      )
    expect(job).to be_valid
  end

  it "is invalid without a title" do 
    job = Job.new(title: nil)
    job.valid?
    expect(job.errors[:job])
  end

  it "is invalid without a company" do 
    job = Job.new(company: nil)
    job.valid?
    expect(job.errors[:job])
  end

  it "is invalid without a salary" do 
    job = Job.new(salary: nil)
    job.valid?
    expect(job.errors[:job])
  end

  it "is invalid without a location" do 
    job = Job.new(location: nil)
    job.valid?
    expect(job.errors[:job])
  end

end