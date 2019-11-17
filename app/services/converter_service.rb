# refer to this link for help/debugging if /app/services doesn't autoload: 
# https://stackoverflow.com/questions/37156226/how-can-i-add-a-services-directory-to-the-load-path-in-rails/37157085

# code/methods being migrated from converter_controller.rb
class ConverterService
    def initialize(game_system, output_character)
        @game_system = game_system
        @output_character = {}
    end


end