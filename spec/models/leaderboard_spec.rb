# == Schema Information
#
# Table name: leaderboards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Leaderboard, type: :model do
  it { should have_many(:users) }
  it { should respond_to(:name) }
end
