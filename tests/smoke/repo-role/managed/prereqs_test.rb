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

# Prereqs tests

if os[:name] == 'ubuntu'

  # Check if GPG key has been installed
  describe file('/usr/share/keyrings/cloudflared.gpg') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 0644 }
  end

  # Check if package repo has been deployed
  describe file('/etc/apt/sources.list.d/pkg_cloudflare_com.list') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 0644 }
  end

  # Check if cloduflared is installed
  describe package('cloudflared') do
    it { should be_installed }
  end

else
  # Do nothing
end
