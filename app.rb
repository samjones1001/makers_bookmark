require 'sinatra/base'
require './lib/link'
require './database_connection_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/link/new' do
    flash[:notice] = 'Please enter a valid url' unless Link.create(params['url'], params['title'])
    redirect '/'
  end

  get '/link/update' do
    p params
    @link = Link.find(params['id'])
    erb :update
  end

  post '/link/update' do
    Link.update(params['id'], params['url'], params['title'])
    redirect '/'
  end

  post '/link/delete' do
    Link.delete(params['id'])
    redirect '/'
  end

  run! if app_file == $0
end
