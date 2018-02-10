class GamesController < ApplicationController

  # returns json for the index page at /games
  def index
    games = Game.where(active: true)
    games_json = games.to_json(only: %i[id name year manufacturer])

    render json: games_json
  end

  # return json for the details of the game at /games/:id
  def show
    game = Game.find(params[:id])

    # add full url for image if it exists
    if game.image.exists?
      game.image_url = request.protocol + request.host_with_port +
                       game.image.url
    end

    game_json = game.to_json(only: %i[id name description year manufacturer
                                      likes],
                             methods: [:image_url])

    render json: game_json
  end

  # creates a like for a game and sends email receipt
  def like
    game = Game.find(params[:id])
    game.like(request.remote_ip)

    render json: game.likes
  end

end
