class ApplicationController < Sinatra::Base

  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/games' do
    # get all the games from the database
    games = Game.all
    # return a JSON response with an array of all the game data
    games.to_json
  end

  get '/games/:id' do
    # look up the game in the database using its ID
    game = Game.find(params[:id])
    # send a JSON-formatted response of the game data
    game.to_json(include: :reviews)
  end
end
