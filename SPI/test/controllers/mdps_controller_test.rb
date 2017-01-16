require 'test_helper'

class MdpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mdp = mdps(:one)
  end

  test "should get index" do
    get mdps_url
    assert_response :success
  end

  test "should get new" do
    get new_mdp_url
    assert_response :success
  end

  test "should create mdp" do
    assert_difference('Mdp.count') do
      post mdps_url, params: { mdp: { id_mdp: @mdp.id_mdp, nombre_mdp: @mdp.nombre_mdp } }
    end

    assert_redirected_to mdp_url(Mdp.last)
  end

  test "should show mdp" do
    get mdp_url(@mdp)
    assert_response :success
  end

  test "should get edit" do
    get edit_mdp_url(@mdp)
    assert_response :success
  end

  test "should update mdp" do
    patch mdp_url(@mdp), params: { mdp: { id_mdp: @mdp.id_mdp, nombre_mdp: @mdp.nombre_mdp } }
    assert_redirected_to mdp_url(@mdp)
  end

  test "should destroy mdp" do
    assert_difference('Mdp.count', -1) do
      delete mdp_url(@mdp)
    end

    assert_redirected_to mdps_url
  end
end
