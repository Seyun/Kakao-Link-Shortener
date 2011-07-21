require 'test_helper'

class KakaoLinksControllerTest < ActionController::TestCase
  setup do
    @kakao_link = kakao_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kakao_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kakao_link" do
    assert_difference('KakaoLink.count') do
      post :create, :kakao_link => @kakao_link.attributes
    end

    assert_redirected_to kakao_link_path(assigns(:kakao_link))
  end

  test "should show kakao_link" do
    get :show, :id => @kakao_link.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @kakao_link.to_param
    assert_response :success
  end

  test "should update kakao_link" do
    put :update, :id => @kakao_link.to_param, :kakao_link => @kakao_link.attributes
    assert_redirected_to kakao_link_path(assigns(:kakao_link))
  end

  test "should destroy kakao_link" do
    assert_difference('KakaoLink.count', -1) do
      delete :destroy, :id => @kakao_link.to_param
    end

    assert_redirected_to kakao_links_path
  end
end
