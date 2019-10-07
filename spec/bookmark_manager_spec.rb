# frozen_string_literal: true

require 'bookmark_manager'

describe BookmarkManager do
  # let(:bookmarks) { ['bbc', 'wiki', 'destroyallsoftware'] }
  subject(:bookmark_manager) { described_class.new }

  describe '#all' do
    it 'returns all bookmarks' do
      bookmarks = BookmarkManager.all
      expect(bookmarks).to include('https://www.bbc.co.uk/')
      expect(bookmarks).to include('https://www.google.com')
    end
  end
end
