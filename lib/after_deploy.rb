require 'hipchat'

require 'after_deploy/version'
require 'after_deploy/setup'
require 'after_deploy/railtie' if defined?(Rails)

module AfterDeploy

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure(*env)
    yield(configuration) if Rails.env.in?(env) || env.to_s == 'all'
  end

end

require "after_deploy/configuration"
require "after_deploy/setup"
require "after_deploy/shell_commands_error"
require "after_deploy/task"
require "after_deploy/task_queue"
require "after_deploy/notifiers"
require "after_deploy/adapters/logger"
require "after_deploy/adapters/hipchat"