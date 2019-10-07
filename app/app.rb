require 'sinatra/base'

class Bookmark < Sinatra::Base
enable :sessions

get '/' do
  erb :index
end

get '/test' do
  "Hello World"
end

get '/bookmarks' do
  @bookmarks = BookmarkManager.all
  erb :bookmarks
end

run! if app_file ==$0

end
