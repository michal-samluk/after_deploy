require 'spec_helper'
describe AfterDeploy::Setup do

  it '#ok?' do
    expect(subject.ok?).to eq('It works fine!')
  end

end