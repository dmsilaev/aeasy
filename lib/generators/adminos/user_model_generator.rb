require 'rails/generators/base'
require 'rails/generators/active_record'

module Adminos
  module Generators
    class UserModelGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_model
        invoke(
          'active_record:model',
          ['User', [
            'email:string',
            'state:string',
            'password_digest:string',
            'first_name:string',
            'last_name:string',
            'confirmation_token:string',
            'reset_password_token:string',
            'avatar:string'
          ]],
          migration: true, timestamps: true
        )
      end

      def inject_model_content
        content = model_contents
        inject_into_class('app/models/user.rb', 'User', content)
      end

      private

      def model_contents
        <<-CONTENT
  has_secure_password validations: false

  validates :email, uniqueness: true, presence: true, email: true
  validates :password_digest, presence: true

  state_machine initial: :waiting_confirmation do
    state :waiting_confirmation
    state :inactive
    state :active

    event :confirm do
      transition [:waiting_confirmation, :inactive] => :active
    end

    event :deactivate do
      transition [:waiting_confirmation, :active] => :inactive
    end
  end

  def generate_confirmation_token
    self.confirmation_token = SecureHelper.generate_token
  end

  def generate_reset_password_token
    self.reset_password_token = SecureHelper.generate_token
  end

  def can_reset_password?
    active?
  end

  def guest?
    false
  end

  def to_s
    "\#\{first_name\} \#\{last_name\}"
  end
        CONTENT
      end
    end
  end
end