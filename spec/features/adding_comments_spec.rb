# frozen_string_literal: true

feature 'adds comments to bookmarks' do
  scenario 'allows the user to add comments to a bookmark' do
    create_bookmark
    first('.bookmark').click_button 'Add Comment'
    fill_in :comment, with: 'Some comment'
    click_button 'Submit'
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_content('Some comment')
  end
end
