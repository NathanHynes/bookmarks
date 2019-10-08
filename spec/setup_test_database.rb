require 'pg'

def setup_test_database
  conn = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the bookmarks notable
  conn.exec('TRUNCATE bookmarks;')
end
