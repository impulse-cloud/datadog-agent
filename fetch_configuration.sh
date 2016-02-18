#!/bin/bash
#set -e

# Fetch datadog configuration files from a git server.
#
# Environment variables used:
#   SSH_KEY - If using a private repo, base64 encode a certificate that has at least access.
# 
#   GIT_TREEISH - defaults to HEAD, but allows for specifying things like `branch_name:subfolder\`
#
#   GIT_SSH_REPO - path to the git repository, e.g. git@bitbucket.org:impulsecloud/some_repo.git
#
# The contents of folders /conf.d and /checks.d will be copied to 
# /etc/dd-agent/conf.d and /etc/dd-agent/checks.d respectively

if [ -n "${SSH_KEY}" ];
then
  mkdir -p /root/.ssh
  echo "${SSH_KEY}" | base64 --decode > /root/.ssh/id_rsa
  chmod 700 /root/.ssh/id_rsa
  echo -e "Host *\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
fi

if [ -z "${GIT_TREEISH}" ];
then
  GIT_TREEISH=HEAD
fi

if [ -n "${GIT_SSH_REPO}" ];
then
  mkdir -p /tmp/gitconf
  cd /tmp/gitconf
  rm -rf *
  git archive --format=tar --remote=${GIT_SSH_REPO} ${GIT_TREEISH} | tar xf -

  # `|| :` is just a trick to suppress the error status code if either conf.d/ or checks.d/ doesn't exist
  cp conf.d/ /etc/dd-agent/conf.d/ || :
  cp checks.d/ /etc/dd-agent/checks.d/ || :
fi
