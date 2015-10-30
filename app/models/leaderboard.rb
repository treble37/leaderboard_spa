# == Schema Information
#
# Table name: leaderboards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Leaderboard < ActiveRecord::Base
  has_many :users, dependent: :destroy
end
