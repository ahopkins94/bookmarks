require 'pg'
def setup_test_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE bookmarks;')
end
def connect
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks(url) VALUES('http://www.makersacademy.com'), ('http://www.destroyallsoftware.com'), ('http://www.google.com');")
end
