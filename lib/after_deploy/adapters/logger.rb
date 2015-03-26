module AfterDeploy
  module Adapters
    class Logger

      def self.call(context)
        tasks = context.tasks.map { |t| t.name if t.respond_to?(:onetime) && t.onetime }.compact.join("\n")
        Rails.logger.warn "You should remove below tasks:\n#{tasks}"
      end

    end
  end
end