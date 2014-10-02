module Adminos
  # Detection for minor differences between Rails 3.2 and 4 in tests.
  def self.rails4?
    Rails.version.start_with? '4'
  end
end

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])