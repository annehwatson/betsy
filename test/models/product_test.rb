require "test_helper"

describe Product do
  let(:product) { Product.new }

  it "must be valid" do
    value(product).must_be :valid?
  end

  describe 'product#retire' do
    it "toggles product.retired boolean to true" do
      product = Product.first
      product_id = product.id

      product.retire

      result = Product.find(product_id)

      result.retired.must_be true
    end
  end
end
