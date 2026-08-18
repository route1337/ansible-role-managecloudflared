Ansible Role - manage_cloudflared: Changelog
============================================
A list of all the changes made to this repo and the role it contains

Version 1.0.0
-------------

**BREAKING CHANGE:** File managed tunnels are no longer supported. Tunnels must be managed from the Zero Trust
console and `manage_cloudflared.console_token` is now required. Hosts still running a file managed tunnel must
have their old service removed manually before this version is applied.

1. Removed file managed tunnel support
2. The tunnel token is no longer echoed in task output
3. Added Ubuntu 24.04 and 26.04 support
4. Removed Ubuntu 20.04 and lower support
5. Role now assumes Ubuntu only without running checks
6. Documentation updates
7. Test Kitchen removed
8. Repository setup modernized
   1. GPG keys are now kept armored at `/etc/apt/keyrings/cloudflared.gpg`
   2. The architecture is now detected instead of hardcoded to `amd64`
   3. Cloudflare does not publish a package repo for every Ubuntu release, so releases they
   have not published fall back to `noble` as a temporary fix
9. Socket buffers raised to the size quic-go recommends
   1. `net.core.rmem_max` raised from 2500000 to 7500000
   2. `net.core.wmem_max` is now set as well
10. All tasks now use fully qualified collection names
    1. `ansible.posix` is now declared in the role metadata

Version 0.5.0
-------------

1. If `manage_cloudflared.tunnel_token` is changed, the service will be reinstalled with the new token

Version 0.4.0
-------------

1. Cloudflared can now be managed by the ZTA console (or Terraform) via a one time use token instead of the local `config.yml` 

Version 0.3.1
-------------

1. `cloudflared` package will now use `state: latest` in order to keep things up to date easily

Version 0.3.0
-------------

1. Updating repo to reflect Cloudflare's new pkg repo source
2. Adding support for Ubuntu 22.04
3. `protocol: quic` is now used for ingress tunnels as well
4. Adding Kitchen testing
   1. NOTE: This requires you to adjust the test suite `host_vars` and `smoke` with real tunnel data or it will fail.  
   **DO NOT ACCIDENTALLY COMMIT REAL TUNNEL DATA**

Version 0.2.2
-------------

1. Adding the httpHostHeader ingress originRequest option

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
