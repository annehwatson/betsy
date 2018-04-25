require 'test_helper'

describe UsersController do
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
      user = User.new(name: 'name', username: 'username', email: 'ada@developers.org', uid: "99999", provider: 'github')
      user.save
      must_respond_with :success
    end
    it "it doesn't add an invalid user" do
      user = {name: 'name', username: nil, email: 'ada@developers.org', uid: nil, provider: 'github'}

        user_count = User.count
        User.new(user).wont_be :valid?
        post users_path, params: { user: user }
        must_respond_with :bad_request
        User.count.must_equal user_count

    end

    it "splits email into username" do
      user = {name: 'name', username: nil, email: 'ada@developers.org', uid: "9999", provider: 'github'}


        user_count = User.count
        User.new(user).must_be :valid?
        post users_path, params: { user: user }
        must_respond_with :success
        User.count.must_equal user_count + 1
        User.last.username.must_equal "ada"

    end
  end
end
