require 'test_helper'

class ArmadasControllerTest < ActionController::TestCase

  test "should create armada" do
    Armada.any_instance.expects(:save).returns(true)
    post :create, :armada => { }
    assert_response :redirect
  end

  test "should handle failure to create armada" do
    Armada.any_instance.expects(:save).returns(false)
    post :create, :armada => { }
    assert_template "new"
  end

  test "should destroy armada" do
    Armada.any_instance.expects(:destroy).returns(true)
    delete :destroy, :id => armadas(:one).to_param
    assert_not_nil flash[:notice]    
    assert_response :redirect
  end

  test "should handle failure to destroy armada" do
    Armada.any_instance.expects(:destroy).returns(false)    
    delete :destroy, :id => armadas(:one).to_param
    assert_not_nil flash[:error]
    assert_response :redirect
  end

  test "should get edit for armada" do
    get :edit, :id => armadas(:one).to_param
    assert_response :success
  end

  test "should get index for armadas" do
    get :index
    assert_response :success
    assert_not_nil assigns(:armadas)
  end

  test "should get new for armada" do
    get :new
    assert_response :success
  end

  test "should get show for armada" do
    get :show, :id => armadas(:one).to_param
    assert_response :success
  end

  test "should update armada" do
    Armada.any_instance.expects(:save).returns(true)
    put :update, :id => armadas(:one).to_param, :armada => { }
    assert_response :redirect
  end

  test "should handle failure to update armada" do
    Armada.any_instance.expects(:save).returns(false)
    put :update, :id => armadas(:one).to_param, :armada => { }
    assert_template "edit"
  end

end