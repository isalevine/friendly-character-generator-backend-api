class SearchListsController < ApplicationController

  def index
    @search_lists = SearchList.all
    render json: @search_lists
  end

  # def show
  #   find_search_list
  #   render json: @search_list
  # end

  def create
    @search_list = SearchList.new(search_list_params)
    if @search_list.save
      render json: @search_list
    end
  end

  # def update
  #   find_search_list
  #   if @search_list.update(search_list_params)
  #     render json: @search_list
  #   end
  # end

  def destroy
    find_search_list
    @search_list.destroy
  end


  private


  def find_search_list
    @search_list = SearchList.find(params[:id])
  end

  def search_list_params
    params.permit(:archetype_id, :search_playstyle_pref, :search_action_pref, :search_stat_pref, :search_power_pref)
  end

end
