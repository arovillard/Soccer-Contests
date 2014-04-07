require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { contest_id: @game.contest_id, game_date: @game.game_date, group: @game.group, team_a_name: @game.team_a_name, team_a_result: @game.team_a_result, team_b_name: @game.team_b_name, team_b_result: @game.team_b_result }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    patch :update, id: @game, game: { contest_id: @game.contest_id, game_date: @game.game_date, group: @game.group, team_a_name: @game.team_a_name, team_a_result: @game.team_a_result, team_b_name: @game.team_b_name, team_b_result: @game.team_b_result }
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to games_path
  end
end
