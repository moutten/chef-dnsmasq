require 'spec_helper'

describe 'dnsmasq::dns' do
  let(:chef_run)          { ChefSpec::Runner.new }
  let(:chef_run_converge) { chef_run.converge(described_recipe) }
  let(:dns_conf) { '/etc/dnsmasq.d/dns.conf' }
  let(:resolv_conf) { '/etc/resolv_dnsmasq.conf' }
  let(:hosts_conf)  { '/etc/hosts_dnsmasq' }

  it 'includes the dnsmasq recipe' do
    expect(chef_run_converge).to include_recipe('dnsmasq')
  end

  describe 'dnsmasq dns.conf template' do
    it 'creates the /etc/dnsmasq.d/dns.conf template' do
      expect(chef_run_converge).to create_template(dns_conf).with(owner: 'dnsmasq')
    end

    it 'notifies service[dnsmasq] to restart' do
      expect(chef_run_converge.template(dns_conf)).to notify('service[dnsmasq]').to(:restart)
    end
  end

  describe 'dnsmasq resolv_dnsmasq.conf template' do
    before(:each) do
      chef_run.node.set['dnsmasq']['dns']['nameservers'] = ['8.8.8.8']
    end
    it 'creates the /etc/resolv_dnsmasq.conf template' do
      expect(chef_run_converge).to create_template(resolv_conf).with(owner: 'dnsmasq')
    end

    it 'notifies service[dnsmasq] to restart' do
      expect(chef_run_converge.template(resolv_conf)).to notify('service[dnsmasq]').to(:restart)
    end
  end

  describe 'dnsmasq hosts_dnsmasq template' do
    before(:each) do
      chef_run.node.set['dnsmasq']['dns']['hosts'] = {"test_ip" => "10.0.0.2"}
    end

    it 'creates the /etc/hosts_dnsmasq template' do
      expect(chef_run_converge).to create_template(hosts_conf).with(owner: 'dnsmasq')
    end

    it 'notifies service[dnsmasq] to restart' do
      expect(chef_run_converge.template(hosts_conf)).to notify('service[dnsmasq]').to(:restart)
    end
  end
end
