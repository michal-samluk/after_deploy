require 'rake'
require 'bundler/gem_tasks'

namespace :after_deploy do

  desc 'Run set of tasks that are required after deployment.'
  task setup: :environment do
    AfterDeploy::Setup.call
  end

end