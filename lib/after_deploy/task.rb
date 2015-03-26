require 'rake'
module AfterDeploy
  class Task

    attr_accessor :name, :arguments, :onetime

    def initialize(name, options={})
      @name = name
      @onetime = options.fetch(:onetime) { false }
      @arguments = options.fetch(:arguments) { [] }
    end

    def call
      cache("onetime_task:#{name}", onetime) do |cached|
        puts "Running task: #{name} with arguments: #{arguments}"
        Rake::Task[name].invoke *arguments unless cached
        puts "Finished task: #{name}"
      end
    end

    def cache(key, cachable)
      cached = Rails.cache.read(key)
      unless cached
        yield(cached)
        Rails.cache.write(key, true) if cachable
      end
    end

  end
end