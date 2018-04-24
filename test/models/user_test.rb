require "test_helper"

describe User do
  let(:user) { User.new(
    username: "Greg",
    provider: 'github',
    email: 'Greg@naver.com',
    uid: 901 ) }

  it "must be valid" do
    value(user).must_be :valid?
  end

  describe 'relations' do
    it 'has a list of products' do
      user = users(:anne)
      user.must_respond_to :products

      user.products.each do |product|
        product.must_be_kind_of Product
      end
    end
  end

  describe 'validations' do
    it 'requires a username' do
      user = User.new
      user.valid?.must_equal false
      user.errors.messages.must_include :username
    end

    it 'requires a unique username' do
      user = User.new(
        username: 'username',
        password: 'helloworld',
        uid: 123,
        provider: 'github')

      user.save!

      user2 = User.new(username: 'username')
      result = user2.save
      result.must_equal false
      user2.errors.messages.must_include :username
    end
  end
end
