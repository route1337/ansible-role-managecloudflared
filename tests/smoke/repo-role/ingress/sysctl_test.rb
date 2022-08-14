#
# Project:: Ansible Role - manage_cloudflared
#
# Copyright 2022, Route 1337 LLC, All Rights Reserved.
#
# Maintainers:
# - Matthew Ahrenstein: matthew@route1337.com
#
# See LICENSE
#

# Sysctl tests

if os[:name] == 'ubuntu'

  # Check if sysctl.conf has been updated
  describe file('/etc/sysctl.conf') do
    its('content') { should match /net\.core\.rmem_max=2500000/ }
  end

  # Check if sysctl has been reloaded
  describe command('sysctl -n net.core.rmem_max') do
    its('stdout') { should match /2500000/ }
  end

else
  # Do nothing
end
