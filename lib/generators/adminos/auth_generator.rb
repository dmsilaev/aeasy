require 'rails/generators/base'

module Adminos
  module Generators
    class AuthGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def add_auth_routes
        auth_route  = "scope module: :adminos do\n"
        auth_route << "    resource :session, only: [:new, :create, :destroy]\n"
        auth_route << "  end\n"
        route auth_route
      end
    end
  end
end
