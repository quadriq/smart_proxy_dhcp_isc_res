require 'test_helper'
require 'smart_proxy_dhcp_isc_res/dhcp_isc_res_configuration'
require 'smart_proxy_dhcp_isc_res/dhcp_isc_res_plugin'

class DhcpIscResDefaultSettingsTest < Test::Unit::TestCase
  def test_default_settings
    Proxy::Dns::DhcpIscRes::Plugin.load_test_settings({})
    assert_equal "default_value", Proxy::Dns::DhcpIscRes::Plugin.settings.required_setting
    assert_equal "/must/exist", Proxy::Dns::DhcpIscRes::Plugin.settings.required_path
  end
end
