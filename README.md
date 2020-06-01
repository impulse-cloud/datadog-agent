# impulse-cloud/datadog-agent

Fork of the official DataDog which can load configuration files at startup from a git repository.

See the [DataDog documentation](https://docs.datadoghq.com/agent/docker/?tab=standard#integrations), [DataDog image](https://hub.docker.com/r/datadog/agent), and [DataDog github repository](https://github.com/DataDog/datadog-agent/tree/master/Dockerfiles/agent/amd64) for more information about using the agent container.

## Usage

We use a single repository with subfolders for each stack (e.g. staging / production). 
Each subfolder then contains conf.d/ and checks.d/ folders which are set up for the specific services running in each stack.

To update the configuration, we push to the git repository and redeploy the Datadog Agent container.

## Additional Environment Variables

* `SSH_KEY` -  If using a private repo, base64 encode a certificate that has at least read access.
* `GIT_SSH_REPO` - path to the git repository similar to what you would use with `git clone`, e.g. `git@bitbucket.org:impulsecloud/some_repo.git`
* `GIT_TREEISH` - defaults to HEAD, but allows for specifying things like `branch_name:subfolder\`
