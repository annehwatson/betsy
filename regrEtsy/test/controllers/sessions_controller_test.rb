require "test_helper"

describe SessionsController do
  describe "auth_callback" do
    it "should log in an existing user and redirects them back to the homepage" do
      start_count = User.count
      user = users(:anne)

      #Action
      login(user)
      #Assert
      must_respond_with :redirect
      must_redirect_to root_path
      User.count.must_equal start_count
      session[:user_id].must_equal user.id
    end

    it "can log in a new user" do
      start_count = User.count
      user = User.new username: "Greg", provider: 'github', email: 'RapMonster@naver.com'
      user.uid = 901

      login(user)

      #Assert
      must_respond_with :redirect
      must_redirect_to root_path
      User.count.must_equal (start_count + 1)
      saved_user = User.find_by(username: "annehwatson")
      session[:user_id].must_equal saved_user.id
    end

    it "can log a user out" do
      login(users(:anne))
      session[:user_id].must_equal users(:anne).id

      get logout_path
      must_respond_with :redirect
      must_redirect_to root_path
    end

    it 'does not log in if the user data is invalid' do
      # Validations fails
      user = User.new(
        uid: 99999,
        provider: "github",
        email: nil,
        name: nil)

      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))

      get auth_callback_path(:github)

      must_respond_with :error
      must_redirect_to root_path
      session[:user_id].must_equal nil
    end
    it 'does not log in with insufficient data' do
      start_count = User.count

      user = User.new(
        provider: "github",
        email: 'something@adadevelopersacademy.org',
        name: 'something')

      login(user)

      User.count.must_equal start_count
      # Auth hash doesn not include a uid
    end

  end
end
