module AfterDeploy
  class Notifiers < Array

    def add(notifier)
      self << if notifier.respond_to?(:call)
                notifier
              else
                AfterDeploy::Adapters.const_get(notifier.to_s.classify)
              end
    end

  end
end