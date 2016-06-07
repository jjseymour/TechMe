describe 'Sign Up Page' do
  
  it 'lets the user click the signup button', :js => true do
    visit '/signup' 

    fill_in('Username', with: 'Brozera')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    
    click_link('Sign Up') 
    
    page.should have_content('TechMe')
  end

end 