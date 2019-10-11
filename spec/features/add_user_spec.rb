feature 'user creation' do
  scenario 'a new user is created' do
    vist('/')
    click_button 'Sign up'
    fill_in :email, with: 'testemail@email.com'
    fill_in :password, with: 'password10'
    click_button 'Submit'

    expect(page).to have content 'Welcome testemail@email.com'
  end
end
