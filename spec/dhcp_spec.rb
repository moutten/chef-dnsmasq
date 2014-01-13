require 'spec_helper'

describe 'dnsmasq::dhcp' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  let(:dhcp_conf) { '/etc/dnsmasq.d/dhcp.conf' }

  it 'includes the dnsmasq::dns recipe' do
    expect(chef_run).to include_recipe('dnsmasq::dns')
  end

  describe 'dnsmasq dhcp.conf template' do
    it 'creates the /etc/dnsmasq.d/dhcp.conf template' do
      expect(chef_run).to create_template(dhcp_conf).with(owner: 'dnsmasq')
    end

    it 'notifies service[dnsmasq] to restart' do
      expect(chef_run.template(dhcp_conf)).to notify('service[dnsmasq]').to(:restart)
    end
  end
end
