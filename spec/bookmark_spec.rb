require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connect
      bookmarks = Bookmark.all
      expect(bookmarks[0].url).to include("http://www.makersacademy.com")
      expect(bookmarks[1].url).to include("http://www.destroyallsoftware.com")
      expect(bookmarks[2].url).to include("http://www.google.com")
    end
  end
  describe ".add" do
    it 'adds a bookmark' do
      Bookmark.add('www.google.com', "google")
      expect(Bookmark.all[0].url).to include("www.google.com")
    end
  end
end
