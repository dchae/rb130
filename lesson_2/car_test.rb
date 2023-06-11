require "minitest/autorun"
require "minitest/reporters"
MiniTest::Reporters.use!

require_relative "car"

class CarTest < MiniTest::Test
  attr_accessor :car

  def setup
    @car = Car.new
  end

  def teardown
  end

  def test_wheels
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip "Skipping this test - it is meant to fail"
    assert_equal(3, car.wheels)
  end

  def test_car_exists
    assert(car)
  end

  def test_name_is_nil
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) { Car.new(name: "Joey") }
  end

  def test_instance_of_car
    assert_instance_of(Car, car)
  end

  def test_includes_car
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end

  def test_kind_of_Object
    assert_kind_of(Object, car)
  end
end
