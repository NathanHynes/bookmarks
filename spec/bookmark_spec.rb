# frozen_string_literal: true

require 'bookmark'
require 'database_helpers'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do
      conn = PG.connect :dbname => 'bookmark_manager_test'
      bookmark = Bookmark.create(address: 'https://www.miniclip.com/games/en/', title: 'Miniclip')
      Bookmark.create(address: 'https://shredsauce.com', title: 'Shredsauce')
      Bookmark.create(address: 'https://www.spacejam.com', title: 'Space Jam')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'Miniclip'
      expect(bookmarks.first.url).to eq 'https://www.miniclip.com/games/en/'
    end
  end

  describe '.create' do
    it 'creates a bookmark' do
      bookmark = Bookmark.create(address: 'http://www.bbc.co.uk', title: 'BBC News')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'BBC News'
      expect(bookmark.url).to eq 'http://www.bbc.co.uk'
    end
  end
end
