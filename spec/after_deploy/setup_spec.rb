require 'spec_helper'
describe AfterDeploy::Setup do

  subject { AfterDeploy::Setup.new AfterDeploy.configuration }

  it '#ok?' do
    expect(subject.ok?).to eq('It works fine!')
  end

end