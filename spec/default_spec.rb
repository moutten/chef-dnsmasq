require 'spec_helper'

describe 'dnsmasq::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs the dnsmasq package' do
    expect(chef_run).to install_package('dnsmasq')
  end

  describe 'dnsmasq service' do
    it 'enables the service' do
      expect(chef_run).to enable_service('dnsmasq')
    end

    it 'starts the service' do
      expect(chef_run).to start_service('dnsmasq')
    end
  end
end
