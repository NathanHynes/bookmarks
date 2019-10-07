# frozen_string_literal: true

feature 'shows all bookmarks' do
  scenario 'Page returns all bookmarks' do
    visit('/')
    click_button 'Show all bookmarks'
    expect(page).to have_content "BBC news\nWikipedia"
  end
end
