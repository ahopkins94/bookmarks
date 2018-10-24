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
  describe ".delete" do
    it 'deletes a bookmark' do
      Bookmark.add('www.google.com', "google")
      Bookmark.delete(Bookmark.all[0].id)
      expect(Bookmark.all).to be_empty
    end
  end
  describe ".update" do
    it 'updates a bookmark' do
      Bookmark.add('www.google.com', "google")
      Bookmark.update(Bookmark.all[0].id, 'http://google.com', 'google updated')
      expect(Bookmark.all[0].url).to include('http://google.com')
      expect(Bookmark.all[0].title).to include('google updated')
    end
  end
end
