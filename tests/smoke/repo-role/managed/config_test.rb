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

# Config tests

if os[:name] == 'ubuntu'

  # Verify the config.yml is deployed correctly
  # NOTE: This data should be adjusted to reflect your real tunnel!
  describe file('/etc/cloudflared/config.yml') do
    it { should_not exist}
  end

  # Verify the credentials.json is deployed correctly
  # NOTE: This data should be adjusted to reflect your real tunnel!
  describe file('/etc/cloudflared/credentials.json') do
    it { should_not exist}
  end

else
  # Do nothing
end
