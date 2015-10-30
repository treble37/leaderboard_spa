# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  name           :string
#  games_won      :integer
#  games_lost     :integer
#  win_loss_ratio :decimal(, )
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  leaderboard_id :integer
#

class User < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :leaderboard
end
