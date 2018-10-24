require 'pg'

class Bookmark

  attr_reader :url, :title
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
    conn = PG.connect(dbname: 'bookmark_manager_test')
  else
    conn = PG.connect(dbname: 'bookmark_manager')
  end
    result = conn.exec( "SELECT * FROM bookmarks" )
    result.map { |bookmark| Bookmark.new(bookmark['url'], bookmark['title']) }
  end

  def self.add(url, title)
    if ENV['ENVIRONMENT'] == 'test'
    conn = PG.connect(dbname: 'bookmark_manager_test')
  else
    conn = PG.connect(dbname: 'bookmark_manager')
  end
    conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');")
  end

  def initialize(url, title)
    @url = url
    @title = title
  end

end
