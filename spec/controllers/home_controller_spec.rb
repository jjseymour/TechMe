require 'rails_helper'

describe HomeController do

  describe "GET #show" do
    
    it "gets the show view" do
      get "show"
      expect(response).to render_template :show 
    end

  end

end 