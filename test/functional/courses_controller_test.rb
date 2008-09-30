require File.dirname(__FILE__) + '/../test_helper'
require 'courses_controller'

# Re-raise errors caught by the controller.
class CoursesController; def rescue_action(e) raise e end; end

class CoursesControllerTest < Test::Unit::TestCase
  fixtures :courses

  def setup
    @controller = CoursesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:courses)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_course
    old_count = Course.count
    post :create, :course => { }
    assert_equal old_count+1, Course.count
    
    assert_redirected_to course_path(assigns(:course))
  end

  def test_should_show_course
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_course
    put :update, :id => 1, :course => { }
    assert_redirected_to course_path(assigns(:course))
  end
  
  def test_should_destroy_course
    old_count = Course.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Course.count
    
    assert_redirected_to courses_path
  end
end
