require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @post = posts(:one)
    @short_post = posts(:short)
  end

  test "should update post" do
    sign_in users(:user1)
    patch post_url(@post), params: { post: { category_id: @post.category_id, description: @post.description, title: @post.title } }
    assert_response :found
  end

  test "anon should not update post" do
    patch post_url(@post), params: { post: { category_id: @post.category_id, description: @post.description, title: @post.title } }
    assert_response :redirect
  end

  test "should not create inappropriate post" do
    sign_in users(:user1)
    assert_no_difference('Post.count') do
      post posts_url, params: { post: { category_id: @post.category_id, description: "This is inappropriate!", title: @post.title } }
    end
  end

  test "should not create post with short fields" do
    sign_in users(:user1)
    assert_no_difference('Post.count') do
      post posts_url, params: { post: { category_id: @short_post.category_id, description: @short_post.description, title: @short_post.title } }
    end
    assert_response :success
  end

  test "should create post" do
    sign_in users(:user1)
    assert_difference('Post.count') do
      post posts_url, params: { post: { category_id: @post.category_id, description: @post.description, title: @post.title } }
    end
  end

  test "should not create post" do
    current_user=nil
    assert_no_difference('Post.count') do
      post posts_url, params: { post: { category_id: @post.category_id, description: @post.description, title: @post.title } }
    end
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:user1)
    get edit_post_url(@post)
    assert_response :success
  end

  test "should destroy post" do
    sign_in users(:user1)
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end

  test "should not destroy post" do
    assert_no_difference('Post.count') do
      delete post_url(@post)
    end
  end
end
