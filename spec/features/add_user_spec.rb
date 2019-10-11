feature 'user creation' do
  scenario 'a new user is created' do
    visit('/')
    click_button 'Sign up'
    fill_in :email, with: 'testemail@email.com'
    fill_in :password, with: 'password10'
    click_button 'Submit'

    expect(page).to have_content 'Welcome testemail@email.com'
  end
end
