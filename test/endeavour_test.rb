require 'test_helper'

Endeavour.hook!

class EndeavourTest < Minitest::Test
  def test_call
    colors = { red: :rojo }
    assert_equal :rojo, colors.try(:[], :red)
  end

  def test_delegate
    colors = { red: :rojo }
    assert_equal :rojo, colors.try[:red]
  end

  def test_delegate_with_nil
    colors = nil
    assert_equal nil, colors.try[:red]
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
