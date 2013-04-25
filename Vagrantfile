require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # The path to the Berksfile to use with Vagrant Berkshelf
  # config.berkshelf.berksfile_path = "./Berksfile"

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  config.vm.host_name = "dnsmasq-berkshelf"

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :hostonly, "33.33.33.10"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.

  # config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port 80, 8080

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      'dnsmasq' => {
        'dhcp' => {
          'default_route' => '33.33.33.1',
          'dhcp_range'    => '33.33.33.100,33.33.33.150,12h',
          'dhcp_hosts'    => [
            '11:22:33:44:55:66,33.33.33.101'
          ],
          'tags' => [
            {
              :tag_name => "alternate_internet",
              :dhcp_hosts => [
                "11:22:33:44:55:66,33.33.33.151"
              ],
              :dhcp_range => "33.33.33.100,33.33.33.150,12h",
              :mac_addresses => [
                "00:60:8C:*:*:*"
              ],
              :route => "33.33.33.2"
            }
          ]
        },
        'domain' => 'testlan',
        'dns' => {
          'nameservers' => [
            '8.8.8.8',
            '8.8.4.4'
          ],
          'hosts' => {
            "this-is-a-test"  => "10.0.0.2",
            "also-a-test.com" => "10.0.0.3"
          }
        }
      }
    }

    chef.run_list = [
      "recipe[dnsmasq::dhcp]",
      "recipe[dnsmasq::dns]"
    ]
  end
end
