namespace :after_deploy do

  task setup: :environment do
    AfterDeploy::Setup.call
  end

end