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
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 0600 }
    its('content') { should match /credentials-file: \/etc\/cloudflared\/credentials\.json/ }
    its('content') { should match /no-autoupdate: true/ }
    its('content') { should match /protocol: quic/ }
    its('content') { should match /warp-routing:/ }
    its('content') { should match /enabled: true/ }
  end

  # Verify the credentials.json is deployed correctly
  # NOTE: This data should be adjusted to reflect your real tunnel!
  describe file('/etc/cloudflared/credentials.json') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 0600 }
    its('content') { should match /"AccountTag":"8323ac2fbbedf57eb7cd0d527bb9efca"/ }
    its('content') { should match /"TunnelSecret":"gYcbR1HsZaqnPYdEr2q6gm73e0Jm5NWA63f39kvUJnY="/ }
    its('content') { should match /"TunnelID":"a1b234c5-de67-89f0-g123-4hi5jk678l90"/ }
  end

else
  # Do nothing
end
