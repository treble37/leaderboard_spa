class API < Grape::API
  prefix 'api'
  format :json
  mount LeaderboardSystem::V1 
end
