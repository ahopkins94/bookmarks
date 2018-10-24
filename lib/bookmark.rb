require 'pg'

class Bookmark

  attr_reader :id, :url, :title

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    result = conn.exec( "SELECT * FROM bookmarks" )
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.add(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');")
  end

  def self.update(id, new_url, new_title)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    conn.exec("UPDATE bookmarks SET url = '#{new_url}', title = '#{new_title}' WHERE id = '#{id}';")  
  end

  def self.delete(id)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    conn.exec("DELETE FROM bookmarks WHERE id = '#{id}';")
  end

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

end
