class ConverterController < ApplicationController
    skip_before_action :authorized


    def generate_output_character
        cg = CharacterGenerator.new(game_system: params[:game_system])
        render json: cg.generate_output_character
    end

    
    def archetype_system_converter
        cg = CharacterGenerator.new(game_system: params[:game_system][:game_system])
        cg.archetype = params[:archetype]
        cg.output_character = params[:game_system][:output_character]
        render json: cg.archetype_system_converter
    end
    
end
