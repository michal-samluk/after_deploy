module Deployment
  class Configuration

    attr_accessor :notifiers, :before_migrations, :after_migrations, :hipchat

    def initialize
      @notifiers = Notifiers.new
      @before_migrations = TaskQueue.new
      @after_migrations = TaskQueue.new
      @hipchat = OpenStruct.new(token: ENV['HIPCHAT_TOKEN'], room: ENV['HIPCHAT_ROOM'])
    end

  end
end