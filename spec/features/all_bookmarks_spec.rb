# frozen_string_literal: true

feature 'shows all bookmarks' do
  scenario 'Page returns all bookmarks' do
    visit('/')
    click_button 'Show all bookmarks'
    expect(page).to have_content 'https://www.bbc.co.uk/'
    expect(page).to have_content 'https://www.google.com'
    expect(page).to have_content 'https://www.wikipedia.org/'
  end
end
