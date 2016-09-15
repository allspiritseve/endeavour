class Endeavour
  module CoreExt
    module Object
      module Try
        def try(*args, &block)
          if args.length == 0
            Endeavour.new(self)
          else
            Endeavour.call(self, *args, *block)
          end
        end
      end
    end
  end
end
