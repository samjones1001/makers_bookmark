require 'sinatra/base'
require './lib/link'
require './lib/comment'
require './database_connection_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :index
  end

  post '/link/new' do
    flash[:notice] = 'Please enter a valid url' unless Link.create(params['url'], params['title'])
    redirect '/'
  end

  get '/link/:id/update' do
    @link = Link.find(params['id'])
    erb :update
  end

  post '/link/:id/update' do
    Link.update(params['id'], params['url'], params['title'])
    redirect '/'
  end

  post '/link/:id/delete' do
    Link.delete(params['id'])
    redirect '/'
  end

  get '/link/:id/comment/new' do
    @link = Link.find(params['id'])
    erb :comment
  end

  post '/link/:id/comment' do
    Comment.create(params['link_id'], params['text'])
    redirect '/links'
  end

  run! if app_file == $0
end
