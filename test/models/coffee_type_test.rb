require 'test_helper'

class CoffeeTypeTest < ActiveSupport::TestCase

  test "should save with name" do
    type = CoffeeType.new({
      name: "Cold Brew"
    })
    assert_equal true, type.save, "Should have saved"
  end
  
  test "should not save without name" do
    type = CoffeeType.new({
      name: ""
    })
    assert_equal false, type.save, "Should have not saved"
  end

  
  test "should not save with same name" do
    type = CoffeeType.new({
      name: "Cold Brew"
    })
    type_two = CoffeeType.new({
      name: "Cold Brew"
    })
    assert_equal true, type.save, "Should have saved"
    assert_equal false, type_two.save, "Should have not saved with same name"
  end

  test "should not save with same name case insensitive" do
    type = CoffeeType.new({
      name: "Cold Brew"
    })
    type_two = CoffeeType.new({
      name: "cold brew"
    })
    assert_equal true, type.save, "Should have saved"
    assert_equal false, type_two.save, "Should have not saved with same name"
  end
end
