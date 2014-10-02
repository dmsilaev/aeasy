require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  tests Adminos::SessionsController

  setup do
    @user = User.create(email: 'email@example.com', password: 'password')
  end

  test "#new" do
    get :new
    assert_response :success
  end

  test "#create" do
    attrs = { email: @user.email, password: @user.password }

    post :create, user_sign_in_type: attrs
    assert_response :redirect

    assert { signed_in? }
  end

  test "#destroy" do
    # sign_in @user

    # delete :destroy
    # assert_response :redirect

    # assert { !signed_in? }
  end
end