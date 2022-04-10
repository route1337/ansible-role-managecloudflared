Ansible Role - manage_cloudflared: Changelog
=====================================
A list of all the changes made to this repo and the role it contains

Version 0.2.1
-------------

1. WARP tunnels now use `protocol: quic` in the config to support UDP proxying
2. Adding a sysctl entry for smoother UDP experience if the tunnel is a WARP tunnel
3. Cleaned up some template data in the README.md file

Version 0.2.0
-------------

1. Breaking Fix! The variable names now match the name of the role

Version 0.1.0
-------------

1. Initial Pre-Release of repository

Role Changes:

1. Initial pre-release

Return to [README](README.md)
