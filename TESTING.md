Ansible Role - manage_cloudflared: Testing
===================================
All Route 1337 LLC Ansible roles are typically tested via Test Kitchen however the nature of this role requires
manual testing.

Setting up the manual test environment
---------------------------------------
In order to configure the test environment you will need a few prerequisites. We are assuming you are on a Mac but these instructions
are largely the same for Linux.

1. Install the Ansible linting tool via `brew install ansible-lint`
2. Create a Cloudflare account with an authoritative domain configured
3. Login to a cloudflared install on your local machine and create some test tunnels matching the configurations you are testing changes too.
   1. It's a good idea to test all tunnel variants before opening a PR
4. Validate the role works against your test tunnels

Delayed PRs
-----------
This role covers access changes and should be tested very thoroughly. Unfortunately due to the manual nature of testing,
PRs against this repo may take some time to be reviewed.

Testing Requirements
--------------------
All roles tested this way must follow these testing rules:

1. All roles must be tested fully regarding their option sets.
2. Sample data should be used to verify that templates fill properly.
3. All supported operating systems should be tested against.
4. Code should pass `ansible-lint /path/to/role`

Return to [README](README.md)
