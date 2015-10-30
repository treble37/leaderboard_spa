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

FactoryGirl.define do
  factory :user do
    name "MyString"
games_won 1
games_lost 1
win_loss_ratio "9.99"
  end

end
