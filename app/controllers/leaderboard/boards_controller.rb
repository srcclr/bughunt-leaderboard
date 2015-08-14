module Leaderboard
  class BoardsController < ApplicationController
    skip_before_action :redirect_to_login_if_required, :check_xhr

    respond_to :html, :json

    def index
      respond_to do |format|
        format.json { render json: {} }
        format.html do
          render 'default/empty'
        end
      end
    end
  end
end
