feature 'Add Bookmark' do
  scenario 'Bookmark is added to table' do
    visit('/')
    click_button 'Add bookmark'
    fill_in :url, with: 'https://www.miniclip.com/games/en/'
    fill_in :title, with: 'Miniclip'
    click_button 'Add'
    expect(page).to have_link('Miniclip', href: 'https://www.miniclip.com/games/en/')
  end
end
