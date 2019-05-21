class GameSystemsController < ApplicationController

    def index
        @game_systems = GameSystem.all.to_json
        render json: @game_system
    end

    def show
        @game_system = GameSystem.find(params[:id]).to_json
        render json: @game_system
    end

end
