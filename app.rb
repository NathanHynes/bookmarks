# frozen_string_literal: true

require 'sinatra/base'
require 'uri'
require 'sinatra/flash'
require_relative './lib/bookmark'
require_relative './database_connection_setup'
require_relative './lib/comment'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash

  get '/' do
    redirect '/bookmarks'
  end

  get '/test' do
    'Hello World'
  end

  get '/bookmarks' do
    @user = User.find(id: session[:user_id])
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    unless Bookmark.create(address: params[:url], title: params[:title])
      flash[:notice] = 'You must submit a valid URL.'
    end
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/update' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/update'
  end

  put '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    p params
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/user' do
    p params
    user = User.create(email: params['email'], password: params['password'])
    p user
    session[:user_id] = user.id
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
