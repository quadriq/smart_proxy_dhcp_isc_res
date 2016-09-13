require 'smart_proxy_dhcp_isc_res/dhcp_isc_res_version'

module ::Proxy::DHCP::DhcpIscRes
  class Plugin < ::Proxy::Provider
    # :provider_class is optional and can be omitted in this case, as it follows the naming convention: "plugin namespace::Provider"
    plugin :dhcp_isc_res, ::Proxy::DHCP::DhcpIscRes::VERSION, :provider_class => "::Proxy::DHCP::DhcpIscRes::Provider"

    default_settings :config => '/etc/dhcp/dhcpd.conf', :leases => '/var/lib/dhcpd/dhcpd.leases',
                     :omapi_port => '7911', :reserved => '/etc/dhcp/reserved.conf'

    requires :dhcp, '>= 1.11'
    validate_readable :config, :leases, :reserved

    after_activation do
      require 'smart_proxy_dhcp_isc_res/dhcp_isc_res_main'
      require 'smart_proxy_dhcp_isc_res/dhcp_isc_res_dependencies'
    end
  end
end
