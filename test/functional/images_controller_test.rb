require File.dirname(__FILE__) + '/../test_helper'
require 'images_controller'

# Re-raise errors caught by the controller.
class ImagesController; def rescue_action(e) raise e end; end

class ImagesControllerTest < Test::Unit::TestCase
  fixtures :images

  def setup
    @controller = ImagesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:images)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_image
    old_count = Image.count
    post :create, :image => { }
    assert_equal old_count+1, Image.count
    
    assert_redirected_to image_path(assigns(:image))
  end

  def test_should_show_image
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_image
    put :update, :id => 1, :image => { }
    assert_redirected_to image_path(assigns(:image))
  end
  
  def test_should_destroy_image
    old_count = Image.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Image.count
    
    assert_redirected_to images_path
  end
end
