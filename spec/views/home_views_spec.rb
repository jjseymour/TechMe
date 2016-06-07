describe 'home show page' do
  
  it 'lets the user click the signup button', :js => true do
    visit '/'
    
    within(".hero") do 
      click_link('Sign Up')
    end
    
    page.should have_content('Username')
  end

end 