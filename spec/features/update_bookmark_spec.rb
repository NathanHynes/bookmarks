feature 'update bookmark' do
  it 'returns bookmark with updated details' do
    Bookmark.create(address: 'https://www.spacejam.com', title: 'Space Jam')
    visit('/')
    expect(page).to have_link('Space Jam', href: 'https://www.spacejam.com')
    first('.bookmark').click_button 'Update'
    fill_in :url, with: 'https://www.miniclip.com/games/en/'
    fill_in :title, with: 'Miniclip'
    click_button 'Confirm'
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link('Miniclip', href: 'https://www.miniclip.com/games/en/')
    expect(page).not_to have_link('Space Jam', href: 'https://www.spacejam.com')
  end
end
