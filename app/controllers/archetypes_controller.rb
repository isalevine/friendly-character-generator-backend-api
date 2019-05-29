class ArchetypesController < ApplicationController
  skip_before_action :authorized 

  def index
    @archetypes = Archetype.all.to_json
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


  # path for posting new archetypes from ArchetypeMaker form
  def new_archetype
    new_archetype_params = {
      name: "",
      stat_priorities: {},
      skill_priorities: {},
      power_priorities: {},
      snippet_search_terms: [],
      system_unique: {}
    }
    new_search_list_params = {
      archetype_id: nil,
      search_playstyle_pref: "",
      search_action_pref: "",
      search_stat_pref: nil,
      search_power_pref: "",
    }

    # byebug



    new_archetype_params[:name] = archetype_form_params[:general][:name]

    stat_keys = archetype_form_params[:stats].keys 
    new_archetype_params[:stat_priorities][:chosen_by_player] = stat_keys.map do |key|
      archetype_form_params[:stats][key]
    end

    skill_keys = archetype_form_params[:skills].keys 
    new_archetype_params[:skill_priorities][:chosen_by_player] = skill_keys.map do |key|
      archetype_form_params[:skills][key]
    end

    power_keys = archetype_form_params[:powers].keys 
    new_archetype_params[:power_priorities][:chosen_by_player] = power_keys.map do |key|
      archetype_form_params[:powers][key]
    end

    snippet_keys = archetype_form_params[:snippets].keys 
    new_archetype_params[:snippet_search_terms] = snippet_keys.map do |key|
      archetype_form_params[:snippets][key]
    end

    # hard-coded in for DnD - REFACTOR!!
    dnd_keys = archetype_form_params[:systemUniqueDnd].keys 
    new_archetype_params[:system_unique][:dnd_5th_001] = {}
    new_archetype_params[:system_unique][:dnd_5th_001][:output_skill_preferences] = []
    dnd_keys.each do |key|
      if key == "dnd_skill1" || key == "dnd_skill2" || key == "dnd_skill3"
        new_archetype_params[:system_unique][:dnd_5th_001][:output_skill_preferences] << archetype_form_params[:systemUniqueDnd][key]
      elsif key == "dnd_class"
        new_archetype_params[:system_unique][:dnd_5th_001][:class] = archetype_form_params[:systemUniqueDnd][key]
      elsif key == "dnd_race"
        new_archetype_params[:system_unique][:dnd_5th_001][:race] = archetype_form_params[:systemUniqueDnd][key]
      else
        new_archetype_params[:system_unique][:dnd_5th_001][key.to_sym] = archetype_form_params[:systemUniqueDnd][key]
      end
    end



    archetype_form_params[:searchList][:playstyle].each do |playstyle, boolean|
      if boolean
        new_search_list_params[:search_playstyle_pref] += "#{playstyle}, "
      end
    end
    # hard-coded solution if none are selected - VET THIS ON JAVASCRIPT/FORM SIDE BEFORE FETCHING??
    if new_search_list_params[:search_playstyle_pref] == ""
      new_search_list_params[:search_playstyle_pref] = "physical, mental, social"
    end

    archetype_form_params[:searchList][:action].each do |action, boolean|
      if boolean
        new_search_list_params[:search_action_pref] += "#{action}, "
      end
    end
    # hard-coded solution if none are selected - VET THIS ON JAVASCRIPT/FORM SIDE BEFORE FETCHING??
    if new_search_list_params[:search_action_pref] == ""
      new_search_list_params[:search_action_pref] = "weapon, spells, leader"
    end

    archetype_form_params[:searchList][:power].each do |power, boolean|
      if boolean
        new_search_list_params[:search_power_pref] += "#{power}, "
      end
    end
    # hard-coded solution if none are selected - VET THIS ON JAVASCRIPT/FORM SIDE BEFORE FETCHING??
    if new_search_list_params[:search_power_pref] == ""
      new_search_list_params[:search_power_pref] = "any"
    end




    byebug


    @archetype = Archetype.new(new_archetype_params)
    @search_list = SearchList.new(new_search_list_params)

    if @archetype.save
      byebug
      @search_list[:archetype_id] = @archetype[:id]

      if @search_list.save
        byebug
        render json: @archetype
      end
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
    params.permit(:name, :stat_priorities, :skill_priorities, :power_priorities, :system_unique, :snippet_search_terms)
  end

  def archetype_form_params
    # byebug
    params.permit!
  end

end
