feature 'delete' do
  it 'deletes specified bookmark' do
    visit('/')
    click_button 'Add bookmark'
    fill_in :url, with: 'https://www.miniclip.com/games/en/'
    fill_in :title, with: 'Miniclip'
    click_button 'Add'
    expect(page).to have_link('Miniclip', href: 'https://www.miniclip.com/games/en/')
    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Miniclip', href: 'https://www.miniclip.com/games/en/')
  end
end
