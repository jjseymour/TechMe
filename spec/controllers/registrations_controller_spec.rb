require 'rails_helper'

describe RegistrationsController do

  describe "GET #new" do
    
    it "registers a new user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

  end

end 