class GameSystemsController < ApplicationController

    def index
        @game_systems = GameSystem.all.to_json
        render json: @game_systems
    end

end
