require 'endeavour/core_ext/object/try'
require 'endeavour/core_ext/nil_class/try'

class Endeavour
  def self.hook!
    return if defined?(@try_removed)
    Object.prepend CoreExt::Object::Try
    NilClass.prepend CoreExt::NilClass::Try
  end

  def self.remove_hook!
    CoreExt::Object::Try.send(:remove_method, :try)
    CoreExt::NilClass::Try.send(:remove_method, :try)
    @try_removed = true
  end
end
