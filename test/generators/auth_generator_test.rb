require 'test_helper'
require 'generators/adminos/auth_generator'

class AuthGeneratorTest < Rails::Generators::TestCase
  tests Aeasy::Generators::AuthGenerator
  destination File.expand_path('../../tmp', __FILE__)

  setup do
    prepare_destination
    copy_routes
  end

  test 'route generation for simple model names' do
    run_generator
    assert_file 'config/routes.rb', /resource :session/
  end

  def copy_routes
    routes = File.expand_path('../../rails_app/config/routes_example.rb', __FILE__)
    destination = File.join(destination_root, 'config')

    FileUtils.mkdir_p(destination)
    FileUtils.cp routes, File.join(destination, 'routes.rb')
  end
end