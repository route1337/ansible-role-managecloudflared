Ansible Role - manage_cloudflared
==========================
This repo contains the Ansible role for configuring a cloudflared server in either WARP mode, or ingress mode.

What this role does
-------------------
This Ansible role will allow you to configure cloudflared on an Ubuntu 20.04+ server in either WARP tunnel mode, or in ingress mode.

1. Download and install cloudflared via a package repo
2. Configure cloudflared
    1. Set cloudflared to start as a service
    2. Start cloudflared

Variables
---------
The tunnel configuration files will need to be supplied, as this role intentionally does not include authentication and tunnel creation
for security reasons.

The following variables are required:

1. `manage_cloudflared.warp` - Use WARP tunneling instead of ingresses (Default: `false`)
   ```yaml
   manage_cloudflared.warp: true
   manage_cloudflared.tunnel_uuid: "a1b234c5-de67-89f0-g123-4hi5jk678l90"
   manage_cloudflared.account_tag: "1234567abcdefg890123hijklom45678"
   manage_cloudflared.tunnel_secret: "YmFkc2VjcmV0Cg=="
   manage_cloudflared.tunnel_name: "internal_warp"
   ```
2. Either the `manage_cloudflared.console_token` method or the local configuration method
   ```yaml
   console_token: "BASE64 STRING OF TUNNEL TOKEN"
   ```
   OR
   ```yaml
   manage_cloudflared.tunnel_uuid: "a1b234c5-de67-89f0-g123-4hi5jk678l90"
   manage_cloudflared.account_tag: "1234567abcdefg890123hijklom45678"
   manage_cloudflared.tunnel_secret: "YmFkc2VjcmV0Cg=="
   manage_cloudflared.tunnel_name: "internal_websites"
   manage_cloudflared.ingresses:
      - hostname: statuspage.externaldomain.com
        service: "https://10.1.2.3:443"
        dont_verify_ssl: true
        host_header: "status.internaldomain.com"
      - hostname: timeclock.externaldomain.com
        service: "https://timeclock.internaldomain.net:443"
      - hostname: timeclock.externaldomain.com
        service: "https://timeclock.internaldomain.net:443"
   ```

ZTA Managed Tunnels
-------------------
If you use `manage_cloudflared.console_token` you don't need to specify any other variables as the Zero Trust Console will
manage everything else.

Additionally, please note that migrating between config file managed and ZTA managed tunnels will not work because the service install test
only checks if the service exists, so installing one prior to the other will not result in removing the old style of service. You will have
to manually remove the old service first.

Testing
-------
Due to the nature of the service this role is configuring, all testing is done manually.  
[TESTING.md](TESTING.md) contains details and instructions for testing. 

Donate To Support This Ansible Role
-----------------------------------
Route 1337 LLC's open source code heavily relies on donations. If you find this Ansible role useful, please consider using the GitHub Sponsors button to show your continued support.

Thank you for your support!
