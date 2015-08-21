class FriendsListController < ApplicationController
  def index
    @friends = JSON.parse(access_token.get("api/v1/json/links/friends").body)
  end
end
