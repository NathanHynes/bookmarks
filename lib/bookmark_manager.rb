require 'pg'

class BookmarkManager
  attr_reader :bookmarks

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'student'
    end
    rs = con.exec "SELECT * FROM bookmarks"

    rs.map do |bookmark|
      bookmark['url']
    end
  end
end
