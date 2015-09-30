require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @task = tasks(:one)
  end
  # test "the truth" do
  #   assert true
  # end

  #get(:show, {'id' => "12"}, {'user_id' => 5})
  #get(:view, {'id' => '12'}, nil, {'message' => 'booya!'})
   test "should get index" do
   	sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end
  
  test "should get new" do
    sign_in User.first
    get :new
    assert_response :success
  end

  test "should create task" do
    sign_in User.first
    assert_difference('Task.count') do
      post :create, task: {title: 'Some title'}
  end
  assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    sign_in User.first
    get :show, id: @task
    assert_response :success
  end

  test "should get task" do
    sign_in User.first
    get :edit, id: @task
    assert_response :success
  end
  
  test "should update task" do
    sign_in User.first
    patch :update, id: @task, task: { title: @task.title, text: @task.text, done: @task.done }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
  	sign_in User.first
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end
    assert_redirected_to tasks_path
  end

end
