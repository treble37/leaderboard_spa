require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should belong_to(:leaderboard) }
  it { should belong_to(:user) }
end
