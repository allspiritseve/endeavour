class Endeavour
  class Railtie < Rails::Railtie
    initializer 'endeavour.hook' do
      Endeavour.hook!
    end
  end
end
