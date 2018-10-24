require 'pg'
def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE bookmarks;')
end

def connect
  Bookmark.add('http://www.makersacademy.com')
  Bookmark.add('http://www.destroyallsoftware.com')
  Bookmark.add('http://www.google.com')
end
