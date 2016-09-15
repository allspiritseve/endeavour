class Endeavour
  module CoreExt
    module NilClass
      module Try
        def try(*args, &block)
          if args.length == 0
            Endeavour.new(self)
          end
        end
      end
    end
  end
end
