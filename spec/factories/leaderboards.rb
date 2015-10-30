# == Schema Information
#
# Table name: leaderboards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :leaderboard do
    name "MyString"
  end

end
