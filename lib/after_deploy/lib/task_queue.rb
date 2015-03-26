module Deployment
  class TaskQueue < Array

    def add(task, options={})
      task = if task.respond_to? :call
               task
             else
               Task.new(task, options)
             end
      self.send :<<, task
    end

    private :<<

  end
end