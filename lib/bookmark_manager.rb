require 'pg'

class BookmarkManager
  attr_reader :bookmarks

  def self.all
    con = PG.connect :dbname => 'bookmark_manager', :user => 'duncanskinner'

    rs = con.exec "SELECT * FROM bookmarks"

    rs.map do |bookmark|
      bookmark['url']
    end
  end
end
