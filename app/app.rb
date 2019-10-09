# frozen_string_literal: true

require 'sinatra/base'
require_relative '../lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/bookmarks'
  end

  get '/test' do
    'Hello World'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks/add' do
    Bookmark.create(address: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
