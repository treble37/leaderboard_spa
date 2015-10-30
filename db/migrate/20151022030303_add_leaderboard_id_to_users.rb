class AddLeaderboardIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :leaderboard_id, :integer
  end
end
