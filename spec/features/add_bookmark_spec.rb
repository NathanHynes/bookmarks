# frozen_string_literal: true

feature 'Add Bookmark' do
  scenario 'Bookmark is added to table' do
    visit('/')
    click_button 'Add bookmark'
    fill_in :url, with: 'https://www.bbc.co.uk'
    fill_in :title, with: 'BBC'
    click_button 'Add'
    expect(page).to have_link('BBC', href: 'https://www.bbc.co.uk')
  end

  scenario 'Bookmark must have a valid url' do
    visit '/bookmarks/new'
    fill_in :title, with: 'BBC'
    fill_in('url', with: 'not a real bookmark')
    click_button 'Add'

    expect(page).not_to have_content 'not a real bookmark'
    expect(page).to have_content 'You must submit a valid URL.'
  end
end
