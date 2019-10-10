# frozen_string_literal: true

require 'bookmark'
require 'database_helpers'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.create(address: 'https://www.miniclip.com/games/en/', title: 'Miniclip')
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

  describe '.delete' do
    it 'deletes bookmark' do
      bookmark1 = Bookmark.create(address: 'http://www.bbc.co.uk', title: 'BBC News')
      Bookmark.create(address: 'http://www.bbc.co.uk', title: 'BBC Sport')
      expect{Bookmark.delete(id: bookmark1.id)}.to change{Bookmark.all.length}.by(-1)
    end
  end

  describe '.update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create(address: 'http://www.bbc.co.uk', title: 'BBC News')
      updated_bookmark = Bookmark.update(title: 'BBC Sport', url: 'https://www.bbc.co.uk/sport', id: bookmark.id)
      expect(updated_bookmark.title).to eq 'BBC Sport'
      expect(updated_bookmark.url).to eq 'https://www.bbc.co.uk/sport'
      expect(updated_bookmark.id).to eq bookmark.id
    end
  end

  describe '.find' do
    it 'finds a bookmark' do
      bookmark = Bookmark.create(address: 'http://www.bbc.co.uk', title: 'BBC News')
      result = Bookmark.find(id:bookmark.id)
      expect(result.title).to eq 'BBC News'
      expect(result.url).to eq 'http://www.bbc.co.uk'
      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
    end
  end
end
