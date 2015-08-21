module Leaderboard
  class BoardsController < ApplicationController
    skip_before_action :redirect_to_login_if_required, :check_xhr

    respond_to :html, :json

    rescue_from Mysql2::Error do
      render json: {}, status: 200
    end

    def index
      respond_to do |format|
        format.json { render json: Leaderboard::BoardQuery.new.call, serializer: Leaderboard::BoardQuerySerializer }
        format.html do
          render "default/empty"
        end
      end
    end
  end
end
