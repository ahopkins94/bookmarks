require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connect
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
  describe ".add" do
    it 'adds a bookmark' do
      Bookmark.add('www.google.com')
      expect(Bookmark.all).to include("www.google.com")
    end
  end
end
