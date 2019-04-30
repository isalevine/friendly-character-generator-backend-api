class Api::V1::SearchPreferencesController < ApplicationController

  def show
    find_search_preference
    render json: @search_preference
  end

  def create
    @search_preference = SearchPreference.new(search_preference_params)
    if @search_preference.save
      render json: @search_preference
    end
  end

  # def update
  #   find_search_preference
  #   if @search_preference.update(search_preference_params)
  #     render json: @search_preference
  #   end
  # end

  def destroy
    find_search_preference
    @search_preference.destroy
  end


  private


  def find_search_preference
    @search_preference = SearchPreference.find(params[:id])
  end

  def search_preference_params
    params.permit(:playstyle_preference, :action_preference, :stat_preference, :power_preference)
  end

end
