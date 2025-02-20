require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :"teams/new"
    end

    post '/teams' do
      @team = Team.new(params["team"])

      params["team"]["members"].each do |details|
        Superhero.new(details)
      end

      @heroes = Superhero.all

      erb :"teams/show"

    end

end
