require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  def setup
    @user       = users(:jon)
    @other_user = users(:archer)
  end

  test "should redirect card creation when logged in as a non-admin" do
    log_in_as(@other_user)
    get :new
    assert_redirected_to root_url
  end
end
