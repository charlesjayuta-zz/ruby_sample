

# Run this using bundle exec rake game:like[55,127.0.0.1]
namespace :game do
  task :like, [:game_id, :ip] => :environment do |task, args|
    game = Game.find(args.game_id)

    # output success if not duplicate like
    msg = game.like(args.ip) ? 'successful' : 'unsuccessful'
    puts "Like #{msg} (total: #{game.likes})"
  end
end
