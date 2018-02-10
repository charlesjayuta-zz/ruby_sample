require 'rails_helper'

RSpec.describe Game, type: :model do
  test_ip = '0.0.0.0'

  it 'can create like' do
    game = Game.create!
    game.like(test_ip)

    expect(game.likes).to eq 1
  end

  it 'prevents duplicate likes' do
    game = Game.create!
    game.like(test_ip)
    game.like(test_ip)

    expect(game.likes).to eq 1
  end
end
