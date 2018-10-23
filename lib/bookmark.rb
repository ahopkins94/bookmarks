require 'pg'

class Bookmark
  def self.all
    conn = PG.connect(dbname: 'bookmark_manager')
    result = conn.exec( "SELECT * FROM bookmarks" )
    result.map { |bookmark| bookmark['url'] }
  end

    # [
    #   "http://www.makersacademy.com",
    #   "http://www.destroyallsoftware.com",
    #   "http://www.google.com"
    #  ]

end
