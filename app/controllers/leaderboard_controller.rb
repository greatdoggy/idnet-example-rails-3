require 'net/http'

class LeaderboardController < ApplicationController
  def index
  end

  def submit
  	@result = JSON.parse(access_token.post("api/v1/leaderboard/submit?score=25&pid=#{params[:pid]}").body)
  end
end
