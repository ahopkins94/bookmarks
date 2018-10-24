require 'sinatra/base'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base
  get '/' do
    erb :'bookmarks/index'
  end

  post '/added' do
    Bookmark.add(params[:url], params[:title])
    redirect '/'
  end

  post '/deleted' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/bookmark'
  end

  run! if app_file == $0
end
