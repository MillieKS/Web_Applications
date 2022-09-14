require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do

    return 'Hello!'
  end

  get '/hello' do
    name = params[:name]

    return "Hello #{name}"
  end 

  post '/submit' do
    name = params[:name]
    message = params[:message]

    p "Thanks #{name}, you sent this message: #{message}."
  end

  get '/name' do
    name = params[:name] # The value is 'Alice'
    # name2 = params[:name2] 
    # Do something with `name`...
  
    #return "#{name1}, #{name2}"
    return "#{name}"
  end

  get '/names' do
    name1 = params[:name1]
    name2 = params[:name2]

    return "#{name1}, #{name2}"
  end

  post '/sort-names' do
    name1 = params[:name1]
    name2 = params[:name2]
    name3 = params[:name3]
    name4 = params[:name4]
    name5 = params[:name5]

    return "#{name1},#{name2},#{name3},#{name4},#{name5}".split(',').sort.join(',')
  end
end