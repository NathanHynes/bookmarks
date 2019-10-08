# frozen_string_literal: true

require 'bookmark_manager'

describe BookmarkManager do
  subject(:bookmark_manager) { described_class.new }

  describe '#all' do
    it 'returns all bookmarks' do
      conn = PG.connect :dbname => 'bookmark_manager_test'
      conn.exec("INSERT INTO bookmarks (url) VALUES('https://www.miniclip.com/games/en/');")
      conn.exec("INSERT INTO bookmarks (url) VALUES('https://shredsauce.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES('https://www.spacejam.com');")
      bookmarks = BookmarkManager.all
      expect(bookmarks).to include('https://www.miniclip.com/games/en/')
      expect(bookmarks).to include('https://shredsauce.com')
    end
  end

  describe '#create' do
    it 'creates a bookmark' do
      BookmarkManager.create(address: 'http://www.bbc.co.uk')
      expect(BookmarkManager.all).to include 'http://www.bbc.co.uk'
    end
  end
end
