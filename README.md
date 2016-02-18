# tutum/datadog-agent

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Datadog agent inside a container optimized for Tutum, with added support for storing configuration in a git repository.

See the [DataDog image](https://github.com/DataDog/docker-dd-agent) and [Tutum image](https://github.com/tutumcloud/datadog-agent) for configuration instructions.

## Usage

We use a single repository with subfolders for each stack (e.g. staging / production). 
Each subfolder then contains conf.d/ and checks.d/ folders which are set up for the specific services running in each stack.

To update the configuration, we push to the git repository and redeploy the Datadog Agent container.

## Additional Environment Variables

* `SSH_KEY` -  If using a private repo, base64 encode a certificate that has at least read access.
* `GIT_SSH_REPO` - path to the git repository similar to what you would use with `git clone`, e.g. `git@bitbucket.org:impulsecloud/some_repo.git`
* `GIT_TREEISH` - defaults to HEAD, but allows for specifying things like `branch_name:subfolder\`
