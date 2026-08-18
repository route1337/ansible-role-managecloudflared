Ansible Role - manage_cloudflared
=================================
This repo contains the Ansible role for configuring a cloudflared server against a Zero Trust managed tunnel.

What this role does
-------------------
This Ansible role will allow you to configure cloudflared on an Ubuntu 24.04+ server using a tunnel token issued by
the Cloudflare Zero Trust console. Everything about the tunnel itself, including ingress rules and WARP routing, is
managed from the console rather than from a configuration file on the server.

1. Download and install cloudflared via a package repo
2. Raise the UDP socket buffers to the size quic-go recommends for the QUIC transport
3. Configure cloudflared
    1. Set cloudflared to start as a service using the supplied token
    2. Reinstall the service if the token has changed
    3. Start cloudflared

Requirements
------------
This role targets Ubuntu 24.04 and newer and assumes Ubuntu without running any distribution checks.


Cloudflare does not publish apackage repo for every Ubuntu release. When the host's release is not one they publish,
this role falls back to the `noble` repo, which works because cloudflared ships as a static binary.

Variables
---------
The tunnel configuration token will need to be supplied, as this role intentionally does not include authentication and tunnel creation
for security reasons.

The following variable is required:

1. `manage_cloudflared.console_token` - The tunnel token issued by the Zero Trust console
   ```yaml
   manage_cloudflared:
     console_token: "BASE64 STRING OF TUNNEL TOKEN"
   ```

Token rotation
--------------
The token is written into `/etc/systemd/system/cloudflared.service` by `cloudflared service install`. On every run the
role reads that unit file and compares it against the token in your inventory. If they differ, the old service is
uninstalled and reinstalled with the current token.

Donate To Support This Ansible Role
-----------------------------------
Route 1337 LLC's open source code heavily relies on donations. If you find this Ansible role useful, please consider using the GitHub Sponsors button to show your continued support.

Thank you for your support!
