# refer to this link for help/debugging if /app/services doesn't autoload: 
# https://stackoverflow.com/questions/37156226/how-can-i-add-a-services-directory-to-the-load-path-in-rails/37157085

# code/methods being migrated from converter_controller.rb
class ConverterService
    def initialize(archetype, game_system, output_character)
        @archetype = archetype
        @game_system = game_system
        @output_character = output_character
    end

    # move both generate_output_character and archetype_system_converter methods/logic here...

end