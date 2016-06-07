describe 'Sign Up Page' do
  
  it 'lets the user click the signup button', :js => true do
    visit '/signup'
    #User.create 
    click_button('Sign Up')  # this be an Ajax button -- requires Selenium
    #page.should have_content('Username')
  end

end 