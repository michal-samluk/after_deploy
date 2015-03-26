module AfterDeploy
  module Adapters
    class Logger < ::Logger

      def self.call(context)
        logger = ::Logger.new(STDOUT)
        logger.level = ::Logger::INFO

        tasks = context.tasks.map { |t| t.name if t.respond_to?(:onetime) && t.onetime }.compact.join("\n")
        logger.warn "You should remove below tasks:\n#{tasks}"
      end

    end
  end
end