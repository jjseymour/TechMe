require 'rails_helper'

describe EventsController do

  # WE HAVE TO FIGURE CONTROLLER TESTS WITH AUTH ENABLED
  
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