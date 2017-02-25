require 'test_helper'

class CoffeeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coffee_type = coffee_types(:one)
  end

  test "should get index" do
    get coffee_types_url
    assert_response :success
  end

  test "should create coffee_type" do
    assert_difference('CoffeeType.count') do
      post coffee_types_url, params: { coffee_type: { name: "cold brew" } }
    end
    assert_response :ok
  end

  
  test "should not create coffee_type without a coffee_type" do
    post coffee_types_url, params: { }
    assert_response :bad_request
  end

  test "should not create coffee_type without a name" do
    post coffee_types_url, params: { coffee_type: { name: "" } }
    assert_response :unprocessable_entity
  end
  
  test "should not update when not found" do
    put coffee_type_url("asdffasdf"), params: { coffee_type: { name: "name" } }
    assert_response :not_found
  end
  
  test "should not update when name is blank" do
    existing_type = CoffeeType.create!({
      name: 'hello',
    })
    put coffee_type_url(existing_type.id), params: { coffee_type: { name: "" } }
    assert_response :unprocessable_entity
  end


end
