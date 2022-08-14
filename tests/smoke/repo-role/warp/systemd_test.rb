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

# Systemd tests

if os[:name] == 'ubuntu'

  # Verify the cloudflared service is configured correctly
  describe service('cloudflared') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

else
  # Do nothing
end
