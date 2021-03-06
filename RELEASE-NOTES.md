### 0.10.2

Compatibility:
- Golem: 0.18.2
- Concent: 0.10.2

### 0.10.1
- Added support for deploying multiple golem-messages versions to the same environment (#258).

Compatibility:
- Golem: 0.18.2
- Concent: 0.10.1

### 0.10.0
- Added system that controls free space on nginx-storage (#254).
- Added ability to use different ethereum smart contracts for different clusters (#253).
- Separated secret deployment from cluster deployment (#204).
- The concent-builder server now only uses python 3 (#249).
- Separated cloud management from cluster deployment (#226).
- Added possibility to use an external Signing Service (#246).
- Bugfix: upgrade outdated and unsupported `kubectl` and `google-cloud-sdk` packages (#248).
- Bugfix: upgraded `apt` package from the Debian test repository that caused an error in the Debian images (#252).
- Bugfix: added timeout and passive health check to nginx proxy connection with middleman (#255).

Compatibility:
- Golem: 0.18.0
- Concent: 0.10.0

### 0.9.0
- Middleman is now reachable over TCP from outside the cluster (#212).
- Added Signing Service container which can also be packaged for deployment outside of Concent (#189).
- Signing Service can now be configured to run inside the cluster in test environments (#188).
- Middleman is now a part of the cluster (#187).
- Makefiles now accept the path to a directory containing cluster configuration (`vars.yml`) and don't require linking or copying it (#195).
- Clearing pip cache in concent-api container (#239).
- Secrets are now deployed separately and not a part of the deployment package (203).
- Verification is now always enabled (#216).
- Bugfix: Removed the assumption that nginx-storage always allows plain HTTP (#81).
- Bugfix: nginx containers had the same, conflicting names in Kubernetes (#209).

Compatibility:
- Golem: 0.17.x
- Concent: 0.9.x

### 0.8.0
- All containers and packages updated to the latest versions (#164, #178, #107).
- Changes for compatibility with latest Concent (#183).
- Added setting for enabling verification containers (#181).
- It's now possible to migrate the database without having all the containers deployed to the cluster (#201).
- Bugfix: Verifier did not have access to Concent's private key and could not download files from the storage server (#172).
- Bugfix: Verifier did not know the external address of the cluster and was not able to generate file transfer tokens for its own use (#173).

Compatibility:
- Golem: 0.17.0
- Concent: 0.8.0

### 0.7.3
- Protocol times used for cluster testing adjusted to make tests shorter.
- Bugfix: CUSTOM_PROTOCOL_TIMES setting recently added in Concent was not configured.
- Bugfix: Conductor did not have RabbitMQ URL, which prevented it from reporting uploads.

### 0.7.2
- Kubernetes configuration now always refers to images tagged with a specific version rather than simply to 'latest'.
- Version of Concent and Golem is now hard-coded in the repository. This way version of deployment alone is enough to identify what exactly has been deployed.
- Container versions built from an untagged release from the repository now have more characters from the commit hash (16) to avoid collisions.
- nginx-storage has been refactored to move lua code out of Kubernetes config map and into the container. Now its default configurations allows running the storage server locally in development.
- Getting Golem and Concent code is now part of the build process. It's no longer managed by the build server playbooks.
- concent-deployment-values repository is no longer downloaded on the build server. It only needs to be present on the machine used for deployment.
- HTTP request timeout has been lowered from 150 to 30 seconds.
- gunicorn logging is now more verbose (DEBUG level)
- Adding stack trace to JSON responses was enabled only in concent-api. Now it's enabled by default in all Django-based applications and can be enabled separately for each cluster.
- Bugfix: concent-api-worker was configured to use wrong database.

### 0.7.1
- Bugfix: Conductor and Concent API workers were configured to connect to the wrong databases (verification use case).
- Bugfix: create-services.sh was not waiting for Conductor and Concent API workers to go up along with other services.

### 0.7.0
- Deployment for verifier, conductor and concent workers.
- Kubernetes deployment script now waits for components to become ready and fails if they never do.
- A temporary option for disabling verification workers (they're not fully implemented yet).
- Updated instructions for generating SSL certificates.
- Bugfix: If PostgreSQL did not start when firing unit tests after build, the playbook would fail trying to stop it.

### 0.6.0
- Settings for the payment backend. It's now configured to use the testnet smart contract.
- Deployment for RabbitMQ.
- Deployment for the Conductor app.
- Docker image for verifier, using Golem's blender image as the base image and containing all the necessary dependencies from the imgverifier image.
- Upload notifications in nginx-storage.
- Separate database on the storage cluster.
- A deployment step for running unit tests.
- Running tests and pushing images to the docker registry are now integrated into the build step.
- Updated fast timing settings.
- Temporary workaround for generating concent versions without the version.sh script.
- Enabled `web3` and `net` APIs in geth.
- Added `--rpcvhosts` parameter to geth.
- pip is now always called as `python -m pip` to ensure that the right version is used.
- Refactored local_settings.py into sections.
- Enabled reporting stack trace in JSON error responses from the Django app (a new option of the upcoming middleware).

### 0.5.2
- Django apps are now configured to send the cluster name to Sentry.
- Concent now gets the certificate of the storage cluster.
- Changed how SSL configuration works for nginx. Now HTTPS is always available and HTTP can either be enabled or redirect to HTTPS.

### 0.5.1
- Bugfix: Index page at the entry point to the control cluster no longer claims that it's a dev cluster (it might be a different one).
- Bugfix: OpenResty version is now pinned to 1.13.6.1 due to problems with newer releases.

### 0.5.0
- SSL support (with termination at the entry point to the cluster).
- Python version upgraded to 3.6.
- Django crash reports are now sent to an instance of sentry.io in addition to being sent by e-mail.
- A file with Concent version is now generated during build and inserted into the concent-api container.
- All errors returned from nginx are now in the JSON format.
- Special, shorter timing settings for running automated tests against a live cluster.

### 0.4.0
- Remove hacks formerly required to support pyellptic with OpenSSL 1.0 on Debian. Now Golem provides own version of pyelliptic that works with OpenSSL 1.1 without patching.

### 0.2.3
- File size and checksum verfication on the storage cluster.
- Bugfix: Removed the workaround for a bug in Concent that makes Concent API server fail when checking if files have been uploaded to the storage cluster in the 'force get task result' use case. Gatekeeper is no longer enabled in the concent-api pod.

### 0.2.2
- Bugfix: Workaround for a bug in Concent that makes Concent API server fail when checking if files have been uploaded to the storage cluster in the 'force get task result' use case.

### 0.2.1
- Bugfix: STORAGE_CLUSTER_ADDRESS setting was missing which prevented concent-api from creating valid `FileTransferToken`s.

### 0.2
- geth instance on the cluster

### 0.1.1
- Cluster name is now included in the subject of every error report e-mail .
- Changed default location of secrets on the machine that builds cluster configuration (they're now stored in subdirectories named after clusters).

### 0.1
- Covers 'force report computed task' and 'force get task result' use cases for the Concent server
- Containers and Kubernetes configurations for nginx-proxy, concent-api, nginx-storage, gatekeeper
- Makefiles and build scripts
- Deployment automation scripts
- Playbooks for configuring the build server
- Serving Django assets from nginx-proxy
- Serving docs from nginx-proxy
- E-mail configuration
- Database configuration
- Separate dev and staging configurations
