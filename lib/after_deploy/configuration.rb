module AfterDeploy
  class Configuration

    attr_accessor :notifiers, :before_migrations, :after_migrations, :hipchat

    HIPCHAT = Struct.new(:token, :room)

    def initialize
      @notifiers = Notifiers.new
      @before_migrations = TaskQueue.new
      @after_migrations = TaskQueue.new
      @hipchat = HIPCHAT.new(ENV['HIPCHAT_TOKEN'], ENV['HIPCHAT_ROOM'])

    end

  end
end