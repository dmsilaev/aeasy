require 'rails/generators/base'
require 'rails/generators/active_record'

module Aeasy
  module Generators
    class GuestModelGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_model
        invoke(
          'active_record:model',
          ['Guest'],
          migration: false, timestamps: true
        )
      end

      def injectr_model_content
        content = model_contents
        inject_into_class('app/models/guest.rb', 'Guest', content)
      end

      private

      def model_contents
        <<-CONTENT
  def guest?
    true
  end
        CONTENT
      end
    end
  end
end