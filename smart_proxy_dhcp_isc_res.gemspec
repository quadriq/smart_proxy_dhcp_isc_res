require File.expand_path('../lib/smart_proxy_dhcp_isc_res/dhcp_isc_res_version', __FILE__)
require 'date'

Gem::Specification.new do |s|
  s.name        = 'smart_proxy_dhcp_isc_res'
  s.version     = Proxy::DHCP::DhcpIscRes::VERSION
  s.date        = Date.today.to_s
  s.license     = 'GPLv3'
  s.authors     = ['Dimitri Nilsen']
  s.email       = ['dimitri.nilsen@kit.edu']
  s.homepage    = 'https://github.com/quadriq/smart_proxy_dhcp_isc_res'

  s.summary     = "DHCP ISC provider with reservation handling"
  s.description = "DHCP ISC provider with reservation handling"

  s.files       = Dir['{config,lib,bundler.d}/**/*'] + ['README.md', 'LICENSE']
  s.test_files  = Dir['test/**/*']

  s.add_development_dependency('rake')
  s.add_development_dependency('mocha')
  s.add_development_dependency('test-unit')
end
