# frozen_string_literal: true

require 'bookmark_manager'

describe BookmarkManager do
  subject(:bookmark_manager) { described_class.new }

  describe '#all' do
    it 'returns all bookmarks' do
      bookmarks = BookmarkManager.all
      expect(bookmarks).to include('https://www.miniclip.com/games/en/')
      expect(bookmarks).to include('https://shredsauce.com')
    end
  end
end
