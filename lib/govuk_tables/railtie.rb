module GovukTables
  class Railtie < Rails::Railtie
    initializer "my_gem.view_helpers" do
      ActionView::Base.send :include, TableHelper
    end
  end
end
