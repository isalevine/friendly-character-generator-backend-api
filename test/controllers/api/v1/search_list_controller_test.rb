require 'test_helper'

class Api::V1::SearchListControllerTest < ActionDispatch::IntegrationTest
  test "should get archetype_id:integer" do
    get api_v1_search_list_archetype_id:integer_url
    assert_response :success
  end

  test "should get search_stat_pref:string" do
    get api_v1_search_list_search_stat_pref:string_url
    assert_response :success
  end

  test "should get search_action_pref:string" do
    get api_v1_search_list_search_action_pref:string_url
    assert_response :success
  end

  test "should get search_power_pref:string" do
    get api_v1_search_list_search_power_pref:string_url
    assert_response :success
  end

end
