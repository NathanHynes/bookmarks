# frozen_string_literal: true

feature 'shows all bookmarks' do
  scenario 'Page returns all bookmarks' do
    BookmarkManager.create(address: 'https://www.miniclip.com/games/en/')
    BookmarkManager.create(address: 'https://shredsauce.com')
    BookmarkManager.create(address: 'https://www.spacejam.com')
    visit('/')
    click_button 'Show all bookmarks'
    expect(page).to have_content 'https://www.miniclip.com/games/en/'
    expect(page).to have_content 'https://shredsauce.com'
    expect(page).to have_content 'https://www.spacejam.com'
  end
end
