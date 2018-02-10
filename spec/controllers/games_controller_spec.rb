require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'GET games' do
    it 'renders games as json' do
      get :index
      expect(response.content_type).to eq 'application/json'
    end

    it 'renders active games' do
      Game.create(active: true)
      Game.create(active: false)
      games = Game.where(active: true)
                  .to_json(only: %i[id name year manufacturer])

      get :index
      expect(response.body).to eq games
    end
  end

  describe 'GET game detail' do
    it 'renders game detail as json' do
      game = Game.create!

      get :show, params: { id: game.id }
      expect(response.content_type).to eq 'application/json'
    end

  end

  describe 'POST like' do
    it 'returns game likes as json' do
      game = Game.create!

      post :like, params: { id: game.id }
      expect(response.content_type).to eq 'application/json'
    end
  end
end
