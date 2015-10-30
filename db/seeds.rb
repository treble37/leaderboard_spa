# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

Leaderboard.destroy_all

@leaderboard = Leaderboard.create({ name: "Ping-Pong" })

(0..9).each do |i|
  r = Random.new
  games_won = r.rand(1..100)
  games_lost = r.rand(1..100)
  @leaderboard.users.create({name: Faker::Name.name, games_won: games_won, games_lost: games_lost, win_loss_ratio: games_won.to_f/games_lost.to_f}) 
end
