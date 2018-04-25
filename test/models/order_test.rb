require "test_helper"

describe Order do
  it 'can be created with valid data' do
    old_order_count = Order.count
    order = Order.new(status: :pending)

    order.must_be :valid?

    order = order.save
    result = order.valid?

    result.must_be true

  end
end
