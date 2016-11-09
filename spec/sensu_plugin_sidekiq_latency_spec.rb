require 'spec_helper'

describe SensuPluginSidekiqLatency do
  it 'has a version number' do
    expect(Sensu::Plugin::Sidekiq::Latency::VERSION).not_to be nil
  end
end
