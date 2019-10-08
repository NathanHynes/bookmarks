# frozen_string_literal: true

feature 'shows all bookmarks' do
  scenario 'Page returns all bookmarks' do
    Bookmark.create(address: 'https://www.miniclip.com/games/en/', title: 'Miniclip')
    Bookmark.create(address: 'https://shredsauce.com', title: 'Shredsauce')
    Bookmark.create(address: 'https://www.spacejam.com', title: 'Space Jam')
    visit('/')
    click_button 'Show all bookmarks'
    expect(page).to have_link('Miniclip', href: 'https://www.miniclip.com/games/en/')
    expect(page).to have_link('Shredsauce', href: 'https://shredsauce.com')
    expect(page).to have_link('Space Jam', href: 'https://www.spacejam.com')
  end
end
