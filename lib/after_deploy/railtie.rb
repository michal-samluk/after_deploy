module AfterDeploy
  class Railtie < Rails::Railtie
    railtie_name :after_deploy

    rake_tasks do
      load 'tasks/setup.rake'
    end
  end
end