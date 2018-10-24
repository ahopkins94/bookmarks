require 'sinatra/base'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base

  enable :sessions

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

  get '/update' do
    session[:id] = params[:id]
    erb :'bookmarks/update'
  end

  post '/updated' do
    @id = session[:id]
    Bookmark.update(@id, params[:url], params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
