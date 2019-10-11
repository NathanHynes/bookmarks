# frozen_string_literal: true

feature 'delete' do
  it 'deletes specified bookmark' do
    create_bookmark
    expect(page).to have_link('BBC', href: 'https://www.bbc.co.uk')
    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('BBC', href: 'https://www.bbc.co.uk')
  end
end
