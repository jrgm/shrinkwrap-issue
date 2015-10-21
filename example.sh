#!/usr/bin/env sh

set -e

/bin/rm -rf shrinkwrap-issue
git clone git://github.com/jrgm/shrinkwrap-issue.git
cd shrinkwrap-issue

# ensure it is clean
/bin/rm -rf npm-shrinkwrap.json node_modules

npm install         # ok
npm shrinkwrap      # no --dev

npm ls
# shrinkwrap-issue@1.0.0 /Users/jrgm/tmp33/shrinkwrap-issue
# +-- fxa-jwtool@0.7.1
# | +-- bluebird@2.9.15
# | `-- fetch@0.3.6
# |   `-- encoding@0.1.11
# |     `-- iconv-lite@0.4.13
# `-- pem-jwk@1.5.1
#   `-- asn1.js@1.0.3
#     +-- bn.js@1.3.0
#     +-- inherits@2.0.1
#     `-- minimalistic-assert@1.0.0

npm shrinkwrap
# >> npm WARN shrinkwrap Excluding devDependency: pem-jwk { 'fxa-jwtool': '0.7.1' }
# >> wrote npm-shrinkwrap.json

/bin/rm -rf node_modules
npm install --production
# fxa-jwtool@0.7.1 node_modules/fxa-jwtool
# +-- bluebird@2.9.15
# `-- fetch@0.3.6 (encoding@0.1.11)

npm ls 
# shrinkwrap-issue@1.0.0 /Users/jrgm/tmp33/shrinkwrap-issue
# `-- fxa-jwtool@0.7.1
#   +-- bluebird@2.9.15
#   +-- fetch@0.3.6
#   | `-- encoding@0.1.11
#   |   `-- iconv-lite@0.4.13
#   `-- UNMET DEPENDENCY pem-jwk@1.5.1
# 
# npm ERR! missing: pem-jwk@1.5.1, required by fxa-jwtool@0.7.1



