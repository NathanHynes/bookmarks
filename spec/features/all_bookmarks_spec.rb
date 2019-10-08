# frozen_string_literal: true

feature 'shows all bookmarks' do
  scenario 'Page returns all bookmarks' do
    conn = PG.connect :dbname => 'bookmark_manager_test'
    conn.exec("INSERT INTO bookmarks VALUES(1, 'https://www.miniclip.com/games/en/');")
    conn.exec("INSERT INTO bookmarks VALUES(2, 'https://shredsauce.com');")
    conn.exec("INSERT INTO bookmarks VALUES(3, 'https://www.spacejam.com');")
    visit('/')
    click_button 'Show all bookmarks'
    expect(page).to have_content 'https://www.miniclip.com/games/en/'
    expect(page).to have_content 'https://shredsauce.com'
    expect(page).to have_content 'https://www.spacejam.com'
  end
end
