class Endeavour
	class Rails < ::Rails::Engine
		initializer 'endeavour' do
			Endeavour.hook!
		end
	end if defined?(::Rails)
end
