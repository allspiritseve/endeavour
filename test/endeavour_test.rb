require 'test_helper'
require 'ostruct'

Endeavour.hook!

class EndeavourTest < Minitest::Test
  def test_call_with_object
    color = OpenStruct.new(name: 'Red')
    assert_equal 'Red', color.try(:name)

    color = nil
    assert_equal nil, color.try(:name)
  end

  def test_call_with_hash
    colors = { red: :rojo }
    assert_equal :rojo, colors.try(:[], :red)

    colors = nil
    assert_equal nil, colors.try(:[], :red)
  end

  def test_delegate_with_object
    color = OpenStruct.new(name: 'Red')
    assert_equal 'Red', color.try.name

    color = nil
    assert_equal nil, color.try.name
  end

  def test_delegate_with_hash
    colors = { red: :rojo }
    assert_equal :rojo, colors.try[:red]

    colors = nil
    assert_equal nil, colors.try[:red]
  end

  def test_delegate_block
    numbers = 1.upto(5)
    assert_equal [1, 4, 9, 16, 25], numbers.try.map { |n| n * n }

    numbers = nil
    assert_equal nil, numbers.try.map { |n| n * n }
  end

  def test_remove_hook
    Endeavour.remove_hook!
    assert_raises 'NoMethodError' do
      colors = { red: :rojo }
      colors.try[:red]
    end
    Endeavour.instance_eval { remove_instance_variable :@try_removed }
    load 'endeavour/core_ext/object/try.rb'
    load 'endeavour/core_ext/nil_class/try.rb'
  end
end
