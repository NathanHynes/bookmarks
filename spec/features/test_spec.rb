# frozen_string_literal: true

feature 'test' do
  scenario 'run test' do
    visit '/test'
    expect(page).to have_content('Hello World')
  end
end
