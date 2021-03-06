# Update Terminology Script

This is a quick and simple script to update terminology quickly by combining the script and pdksync.


| Old Term | New Term |
--- | ---
| Puppet Master | Puppet Server|
| master | main|
| Master | Main|
| MASTER | MAIN|
| Blacklist | Blocklist|
| blacklist | blocklist|
| BLACKLIST | BLOCKLIST|
| whitelist | allowlist|
| Whitelist | Allowlist|
| WHITELIST | ALLOWLIST|
| Slave | Agent|
| slave | agent|
| SLAVE | AGENT|


## Prerequisites

- You have a copy of pdksync locally
- You have the pdk installed
- You have a GITHUB_TOKEN generated
- Update lib/pdksync/configuration.rb to the branch you want the PR created against eg `master` or `main`.

Put a copy of `update_terminology.rb` script into the pdksync root directory:

For example: `/Users/paula/workspace/pdksync`

When complete it will look like this: `/Users/paula/workspace/pdksync/update_terminology.rb`


## Example of running the tool
`1) GITHUB_TOKEN=<insert your token> bundle exec rake git:clone_managed_modules`

`2) bundle exec rake 'pdksync:run_a_command[cp ../../update_terminology.rb .]'`

`3) bundle exec rake 'pdksync:run_a_command[ruby update_terminology.rb]'`

`4) bundle exec rake 'pdksync:run_a_command[rm update_terminology.rb]'`

`5) bundle exec rake 'git:create_commit[removal_of_inappropriate_terminology, (feat) - Removal of inappropriate terminology]'`

`6) bundle exec rake 'git:push'`

`7) GITHUB_TOKEN=<insert your token> bundle exec rake 'git:create_pr[(feat) - Removal of inappropriate terminology, feature]'`

## Manually overriding changes

- Navigate to the managed modules cloned repo
`/Users/paula/workspace/pdksync/modules_pdksync/puppetlabs-apache`
- Make and save your changes as normal 
`vim templates/mod/security_crs.conf.erb`
- Stage your changes
`git add templates/mod/security_crs.conf.erb`
- Commit your change
`git commit -m 'Reverting URLs back to master`
- Push your changes
`git push origin pdksync_removal_of_inappropriate_terminology`


*Done*


# BE AWARE

This script was developed to do this process quickly however it will change URLS that contain any of the terms, therefore before merge you need to rectify this.

*Before:* An Apache::OIDCSettings Struct containing [mod_auth_openidc settings](https://github.com/zmartzone/mod_auth_openidc/blob/main/auth_openidc.conf).

*After:* An Apache::OIDCSettings Struct containing [mod_auth_openidc settings](https://github.com/zmartzone/mod_auth_openidc/blob/master/auth_openidc.conf).

The link after is now broken, this will need changed back manually, the script isn't clever enough to check if the URL exists before changing, in this case all the terms `master` in the URL were replaced with `main`.


