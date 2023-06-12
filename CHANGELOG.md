Ansible Role - manage_cloudflared: Changelog
=====================================
A list of all the changes made to this repo and the role it contains

Version 0.4.0
--------------

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
