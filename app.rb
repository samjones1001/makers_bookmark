require 'sinatra/base'
require './lib/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :index
  end

  post '/link/new' do
    Link.create(params['url'])
    redirect '/'
  end

  run! if app_file == $0
end
