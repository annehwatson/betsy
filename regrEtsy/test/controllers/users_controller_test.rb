require 'test_helper'

describe UsersController do
  describe 'index' do
    it "succeeds with all Users" do
      User.count.must_be :>, 0
      get users_path
      must_respond_with :success
    end
    it 'sends a success response when there are no users' do
      User.destroy_all
      get users_path
      must_respond_with :success
    end
  end

  describe 'show' do
    it 'sends success if the user extant' do
      get user_path(User.first)
      must_respond_with :success
    end
    it 'sends not_found if the user is extinct' do
      user_id = User.last.id + 1
      get user_path(user_id)
      must_respond_with :not_found
    end
  end

  describe 'new' do
    it 'succeeds with new user' do
      get new_user_path
      must_respond_with :success
    end
  end

  describe 'create' do
    it 'succeeds when it creates a new user' do
      user = User.new(name: 'name', username: 'usernme', email: 'ada@developers.org')
      user.save
      must_respond_with :success
    end
    it "it doesn't add an invalid book" do
      user = {name: 'name', username: nil, email: 'ada@developers.org'}

        user_count = User.count
        User.new(user).wont_be :valid?
        post users_path, params: { user: user }
        must_respond_with :bad_request
        User.count.must_equal user_count

    end

  end
end
