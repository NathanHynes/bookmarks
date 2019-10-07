require 'sinatra'

class Bookmark < Sinatra::Base
enable :sessions

get '/test' do
  "Hello World"
end

run! if app_file ==$0

end
