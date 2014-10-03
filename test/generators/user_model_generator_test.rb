require 'test_helper'
require 'generators/adminos/user_model_generator'

class UserModelGeneratorTest < Rails::Generators::TestCase
  tests Aeasy::Generators::UserModelGenerator
  destination File.expand_path('../../tmp', __FILE__)

  setup do
    prepare_destination
  end

  test 'user model generation' do
    run_generator
    assert_file 'app/models/user.rb', /state_machine initial: :waiting_confirmation/
  end
end
