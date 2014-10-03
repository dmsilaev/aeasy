require 'test_helper'
require 'generators/adminos/guest_model_generator'

class GuestModelGeneratorTest < Rails::Generators::TestCase
  tests Adminos::Generators::GuestModelGenerator
  destination File.expand_path('../../tmp', __FILE__)

  setup do
    prepare_destination
  end

  test 'user model generation' do
    run_generator
    assert_file 'app/models/guest.rb', /def guest?/
  end
end
