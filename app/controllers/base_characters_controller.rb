
# IS THIS MODEL UNNECESSARY NOW?? Consider removing...


class BaseCharactersController < ApplicationController
  skip_before_action :authorized

  def show
    find_base_character
    render json: @base_character
  end

  def create
    @base_character = BaseCharacter.new(base_character_params)
    if @base_character.save
      render json: @base_character
    end
  end

  # def update
  #   find_base_character
  #   if @base_character.update(base_character_params)
  #     render json: @base_character
  #   end
  # end

  def destroy
    find_base_character
    @base_character.destroy
  end


  private


  def find_base_character
    @base_character = BaseCharacter.find(params[:id])
  end

  def base_character_params
    params.permit(:name, :archetype_id, :search_preference_id)
  end

end
