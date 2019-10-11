# frozen_string_literal: true

require 'pg'

def setup_test_database
  conn = PG.connect(dbname: 'bookmark_manager_test')

  # Clear both comments and bookmark tables
  conn.exec('TRUNCATE bookmarks, comments;')
end
