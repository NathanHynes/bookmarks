# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.all
    con = if ENV['ENVIRONMENT'] == 'test'
            PG.connect dbname: 'bookmark_manager_test'
          else
            PG.connect dbname: 'bookmark_manager', user: 'student'
          end
    rs = con.exec 'SELECT * FROM bookmarks'

    rs.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(address:, title:)
    # return false unless is_url?(address)

    con = if ENV['ENVIRONMENT'] == 'test'
            PG.connect dbname: 'bookmark_manager_test'
          else
            PG.connect dbname: 'bookmark_manager'
          end

    result = con.exec("INSERT INTO bookmarks (url, title) VALUES('#{address}', '#{title}')RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end
end
