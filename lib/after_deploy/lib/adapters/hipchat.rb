module Deployment
  module Adapters
    class Hipchat

      attr_reader :tasks, :config

      def self.call(context)
        self.new(context.tasks, context.config).tap { |i| i.call }
      end

      def initialize(tasks, config)
        @tasks, @config = tasks, config
      end

      def call
        client = ::HipChat::Client.new(config.hipchat.token, api_version: 'v2')
        client[config.hipchat.room].send('DeployBot', message, params)
      end

      private

      def params
        {
            color: 'yellow',
            notify: true,
            message_format: 'html'
        }
      end

      def message
        html = tasks.map { |t| "<li>#{t.name}</li>" if t.respond_to?(:onetime) && t.onetime }.compact.join('')
        "Deployment was finished. You should remove below tasks:<ul>#{html}</ul>"
      end

    end
  end
end