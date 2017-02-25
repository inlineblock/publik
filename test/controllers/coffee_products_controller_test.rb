require 'test_helper'

class CoffeeProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coffee_product = coffee_products(:one)
  end

  test "should get index" do
    get coffee_products_url
    assert_response :success
  end

  test "should get new" do
    get new_coffee_product_url
    assert_response :success
  end

  test "should create coffee_product" do
    assert_difference('CoffeeProduct.count') do
      post coffee_products_url, params: { coffee_product: { coffee_type_id: @coffee_product.coffee_type_id, name: @coffee_product.name, price: @coffee_product.price } }
    end

    assert_redirected_to coffee_product_url(CoffeeProduct.last)
  end

  test "should show coffee_product" do
    get coffee_product_url(@coffee_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_coffee_product_url(@coffee_product)
    assert_response :success
  end

  test "should update coffee_product" do
    patch coffee_product_url(@coffee_product), params: { coffee_product: { coffee_type_id: @coffee_product.coffee_type_id, name: @coffee_product.name, price: @coffee_product.price } }
    assert_redirected_to coffee_product_url(@coffee_product)
  end

  test "should destroy coffee_product" do
    assert_difference('CoffeeProduct.count', -1) do
      delete coffee_product_url(@coffee_product)
    end

    assert_redirected_to coffee_products_url
  end
end
