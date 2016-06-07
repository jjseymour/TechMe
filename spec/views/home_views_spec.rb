describe 'home show page' do
  
  it 'lets the user click the signup button', :js => true do
    visit '/'
    click_button('Sign Up')  # this be an Ajax button -- requires Selenium
    page.should have_content('Username')
  end

end 