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

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should respond_to(:games_won) }
  it { should respond_to(:games_lost) }
  it { should respond_to(:win_loss_ratio) }
  it { should belong_to(:leaderboard) }
  it { should validate_presence_of(:name) }
end
