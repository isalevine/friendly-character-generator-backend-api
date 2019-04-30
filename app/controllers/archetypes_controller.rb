class ArchetypesController < ApplicationController

  def index
    @archetypes = Archetype.all
    render json: @archetypes
  end

  def show
    find_archetype
    render json: @archetype
  end

  def create
    @archetype = Archetype.new(archetype_params)
    if @archetype.save
      render json: @archetype
    end
  end

  # def update
  #   find_archetype
  #   if @archetype.update(archetype_params)
  #     render json: @archetype
  #   end
  # end

  def destroy
    find_archetype
    @archetype.destroy
  end


  private


  def find_archetype
    @archetype = Archetype.find(params[:id])
  end

  def archetype_params
    params.permit(:name)
  end

end
