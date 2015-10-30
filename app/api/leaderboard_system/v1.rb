module LeaderboardSystem

  class V1 < Grape::API
    version 'v1'
    format :json

    desc 'Leaderboard system for keeping track of scores, creating, and deleting users'

    namespace :leaderboards do
      get '/' do
        leaderboards = []
        Leaderboard.find_each do |board|
          leaderboards << board
        end
        leaderboards
      end

      desc 'Retrieve leaderboard users'
      params do
        requires :leaderboard_id, type: Integer, desc: 'leaderboard ID'
      end

      get '/:leaderboard_id/users' do
        leaderboard = Leaderboard.find_by(id: params[:leaderboard_id])
        leaderboard.users.order(games_won: :desc)
      end

      desc 'Update leaderboard user'
      params do
        requires :leaderboard_id, type: Integer, desc: 'leaderboard ID'
        requires :id, type: Integer, desc: 'user ID'
      end

      patch '/:leaderboard_id/users/:id' do
        leaderboard = Leaderboard.find_by(id: params[:leaderboard_id])
        user = leaderboard.users.find_by(id: params[:id])
        user.update(params)
      end

      desc 'create leaderboard user'
      params do
        requires :leaderboard_id, type: Integer, desc: 'leaderboard ID'
      end
      post '/:leaderboard_id/users' do
        leaderboard = Leaderboard.find_by(id: params[:leaderboard_id])
        user = leaderboard.users.create(params)
      end

      desc 'Delete leaderboard user'
      params do
        requires :leaderboard_id, type: Integer, desc: 'leaderboard ID'
        requires :id, type: Integer, desc: 'user ID'
      end
      delete '/:leaderboard_id/users/:id' do
        user = User.find_by(id: params[:id])
        user.destroy
      end

    end

  end

end
