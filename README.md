# Ansible Docker Image

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=flat&logo=docker&logoColor=white)](https://www.docker.com/)
[![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=flat&logo=ansible&logoColor=white)](https://www.ansible.com/)

A production-ready Docker image for Ansible with HashiCorp Vault support and 70+ pre-installed collections for infrastructure automation, cloud management, network device configuration, and more.

## Features

- **Multiple Ansible versions**: Choose between stable (11.12.0) or latest (12.2.0)
- **HashiCorp Vault integration**: Built-in `hvac` library for seamless secrets management
- **70+ Pre-installed collections**: Ready-to-use collections for AWS, Azure, GCP, Cisco, VMware, Kubernetes, and more
- **Security-focused**: Runs as non-root user (UID 1000)
- **Lightweight**: Based on Python slim images
- **CI/CD ready**: Perfect for automated pipelines and Infrastructure as Code workflows

## Supported Versions

| Image Tag | Ansible Version | Python Version | Ansible Core |
|-----------|----------------|----------------|--------------|
| `latest`, `12`, `12.2` | 12.2.0 | 3.12 | 2.19.4 |
| `11`, `11.12` | 11.12.0 | 3.11 | 2.18.11 |

## Quick Start

### Basic Usage

Run an Ansible ad-hoc command:

```bash
docker run --rm optimode/ansible:latest ansible --version
```

Run a playbook from your local directory:

```bash
docker run --rm \
  -v $(pwd):/workspace \
  optimode/ansible:latest \
  ansible-playbook playbook.yml
```

### Interactive Shell

Start an interactive session:

```bash
docker run --rm -it \
  -v $(pwd):/workspace \
  optimode/ansible:latest
```

## Pre-installed Collections

This image comes with 70+ Ansible collections covering a wide range of platforms and technologies:

### Cloud Providers
- **AWS**: `amazon.aws`, `community.aws`
- **Azure**: `azure.azcollection`
- **GCP**: `google.cloud`
- **OpenStack**: `openstack.cloud`
- **Hetzner**: `hetzner.hcloud`
- **Vultr**: `vultr.cloud`
- **DigitalOcean**: `community.digitalocean`

### Network Devices
- **Cisco**: `cisco.ios`, `cisco.nxos`, `cisco.iosxr`, `cisco.aci`, `cisco.meraki`
- **Arista**: `arista.eos`
- **Juniper**: `junipernetworks.junos`
- **VyOS**: `vyos.vyos`
- **F5**: `f5networks.f5_modules`
- **Fortinet**: `fortinet.fortios`, `fortinet.fortimanager`

### Container & Orchestration
- **Kubernetes**: `kubernetes.core`, `kubevirt.core`
- **Docker**: `community.docker`
- **Podman**: `containers.podman`
- **OpenShift**: `community.okd`

### Databases
- **MySQL**: `community.mysql`
- **PostgreSQL**: `community.postgresql`
- **MongoDB**: `community.mongodb`
- **SQL Server**: `lowlydba.sqlserver`

### Storage Systems
- **NetApp**: `netapp.ontap`, `netapp.storagegrid`, `netapp.cloudmanager`
- **Dell EMC**: `dellemc.powerflex`, `dellemc.unity`, `dellemc.openmanage`
- **Pure Storage**: `purestorage.flasharray`, `purestorage.flashblade`
- **Infinidat**: `infinidat.infinibox`

### Security & Secrets
- **HashiCorp Vault**: `community.hashi_vault`
- **CyberArk**: `cyberark.conjur`, `cyberark.pas`
- **Cryptography**: `community.crypto`
- **SOPS**: `community.sops`

### Monitoring & Observability
- **Zabbix**: `community.zabbix`
- **Grafana**: `grafana.grafana`, `community.grafana`
- **Splunk**: `splunk.es`

### Virtualization
- **VMware**: `vmware.vmware`, `vmware.vmware_rest`, `community.vmware`
- **Proxmox**: `community.proxmox`
- **oVirt**: `ovirt.ovirt`
- **libvirt**: `community.libvirt`

<details>
<summary>View complete collection list</summary>

```yaml
amazon.aws, ansible.netcommon, ansible.posix, ansible.utils, ansible.windows,
arista.eos, awx.awx, azure.azcollection, check_point.mgmt, chocolatey.chocolatey,
cisco.aci, cisco.dnac, cisco.intersight, cisco.ios, cisco.iosxr, cisco.meraki,
cisco.mso, cisco.nxos, cisco.ucs, cloudscale_ch.cloud, community.aws,
community.ciscosmb, community.crypto, community.digitalocean, community.dns,
community.docker, community.general, community.grafana, community.hashi_vault,
community.hrobot, community.libvirt, community.mongodb, community.mysql,
community.okd, community.postgresql, community.proxmox, community.proxysql,
community.rabbitmq, community.routeros, community.sap_libs, community.sops,
community.vmware, community.windows, community.zabbix, containers.podman,
cyberark.conjur, cyberark.pas, dellemc.enterprise_sonic, dellemc.openmanage,
dellemc.powerflex, dellemc.unity, f5networks.f5_modules, fortinet.fortimanager,
fortinet.fortios, google.cloud, grafana.grafana, hetzner.hcloud,
hitachivantara.vspone_block, hitachivantara.vspone_object, ibm.qradar,
ibm.storage_virtualize, ieisystem.inmanage, infinidat.infinibox,
infoblox.nios_modules, inspur.ispim, junipernetworks.junos, kaytus.ksmanage,
kubernetes.core, kubevirt.core, lowlydba.sqlserver, microsoft.ad, microsoft.iis,
netapp.cloudmanager, netapp.ontap, netapp.storagegrid, netapp_eseries.santricity,
netbox.netbox, ngine_io.cloudstack, openstack.cloud, ovirt.ovirt,
purestorage.flasharray, purestorage.flashblade, ravendb.ravendb, splunk.es,
telekom_mms.icinga_director, theforeman.foreman, vmware.vmware, vmware.vmware_rest,
vultr.cloud, vyos.vyos, wti.remote
```
</details>

## Building the Image

### Quick Build

Use the provided build script:

```bash
./build.sh
```

This builds Ansible 12.2.0 with Python 3.12 and tags it as `latest`.

### Custom Build

Build a specific version:

```bash
# Ansible 11.12.0 with Python 3.11
docker build \
  --build-arg PYTHON_VERSION=3.11 \
  --build-arg ANSIBLE_VERSION=11.12.0 \
  --tag my-ansible:11 \
  .

# Ansible 12.2.0 with Python 3.12
docker build \
  --build-arg PYTHON_VERSION=3.12 \
  --build-arg ANSIBLE_VERSION=12.2.0 \
  --tag my-ansible:12 \
  .
```

### Build Arguments

| Argument | Description | Required | Default |
|----------|-------------|----------|---------|
| `PYTHON_VERSION` | Python base image version | No | `3.11` |
| `ANSIBLE_VERSION` | Ansible version to install | Yes | - |
| `URL` | Project URL (OCI label) | No | - |
| `SOURCE` | Source repository (OCI label) | No | - |
| `BUILD_DATE` | Build timestamp (OCI label) | No | - |
| `AUTHORS` | Image authors (OCI label) | No | - |
| `VENDOR` | Vendor name (OCI label) | No | - |
| `REVISION` | Git commit hash (OCI label) | No | - |

## Advanced Usage

### Using SSH Keys

Mount your SSH keys for remote host access:

```bash
docker run --rm \
  -v $(pwd):/workspace \
  -v ~/.ssh:/home/ansible/.ssh:ro \
  optimode/ansible:latest \
  ansible-playbook -i inventory.ini playbook.yml
```

### Using Ansible Vault

Pass vault password via file:

```bash
docker run --rm \
  -v $(pwd):/workspace \
  -v $(pwd)/.vault-pass:/home/ansible/.vault-pass:ro \
  optimode/ansible:latest \
  ansible-playbook --vault-password-file=/home/ansible/.vault-pass playbook.yml
```

Or via environment variable:

```bash
docker run --rm \
  -v $(pwd):/workspace \
  -e ANSIBLE_VAULT_PASSWORD=mysecret \
  optimode/ansible:latest \
  ansible-playbook playbook.yml
```

### HashiCorp Vault Integration

The image includes `hvac` library for Vault integration. Configure via environment:

```bash
docker run --rm \
  -v $(pwd):/workspace \
  -e VAULT_ADDR=https://vault.example.com:8200 \
  -e VAULT_TOKEN=s.xxxxxxxxxxxxxx \
  optimode/ansible:latest \
  ansible-playbook playbook.yml
```

### Custom Inventory

Use dynamic inventory or custom inventory files:

```bash
docker run --rm \
  -v $(pwd):/workspace \
  optimode/ansible:latest \
  ansible-playbook -i inventory/production.yml deploy.yml
```

### Installing Additional Collections

Install collections at runtime:

```bash
docker run --rm \
  -v $(pwd):/workspace \
  optimode/ansible:latest \
  bash -c "ansible-galaxy collection install my.collection && ansible-playbook playbook.yml"
```

Or build a custom image:

```dockerfile
FROM optimode/ansible:latest

USER root
COPY my-collections.yml /tmp/
RUN ansible-galaxy collection install -r /tmp/my-collections.yml
USER ansible
```

### Running as Different User

Override the default user (UID 1000):

```bash
docker run --rm \
  --user $(id -u):$(id -g) \
  -v $(pwd):/workspace \
  optimode/ansible:latest \
  ansible-playbook playbook.yml
```

### CI/CD Integration

#### GitHub Actions

```yaml
name: Deploy with Ansible
on: [push]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run Ansible Playbook
        run: |
          docker run --rm \
            -v ${{ github.workspace }}:/workspace \
            -e ANSIBLE_VAULT_PASSWORD=${{ secrets.VAULT_PASSWORD }} \
            optimode/ansible:latest \
            ansible-playbook -i inventory/production.yml deploy.yml
```

#### GitLab CI

```yaml
deploy:
  image: optimode/ansible:latest
  script:
    - ansible-playbook -i inventory/production.yml deploy.yml
  only:
    - main
```

### Environment Variables

Common Ansible environment variables you can use:

| Variable | Description | Example |
|----------|-------------|---------|
| `ANSIBLE_CONFIG` | Path to ansible.cfg | `/workspace/ansible.cfg` |
| `ANSIBLE_INVENTORY` | Default inventory path | `/workspace/inventory` |
| `ANSIBLE_VAULT_PASSWORD` | Vault password | `mysecretpass` |
| `ANSIBLE_HOST_KEY_CHECKING` | SSH host key checking | `False` |
| `ANSIBLE_STDOUT_CALLBACK` | Output format | `yaml` |
| `ANSIBLE_FORCE_COLOR` | Force colored output | `true` |
| `VAULT_ADDR` | HashiCorp Vault address | `https://vault:8200` |
| `VAULT_TOKEN` | Vault authentication token | `s.xxxxx` |

## Examples

### Example 1: Simple Playbook Execution

```bash
# Create a simple playbook
cat > playbook.yml <<EOF
---
- hosts: localhost
  tasks:
    - name: Print Ansible version
      debug:
        msg: "Running Ansible {{ ansible_version.full }}"
EOF

# Run it
docker run --rm -v $(pwd):/workspace optimode/ansible:latest \
  ansible-playbook playbook.yml
```

### Example 2: AWS Infrastructure

```bash
docker run --rm \
  -v $(pwd):/workspace \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=us-east-1 \
  optimode/ansible:latest \
  ansible-playbook aws-deploy.yml
```

### Example 3: Kubernetes Management

```bash
docker run --rm \
  -v $(pwd):/workspace \
  -v ~/.kube/config:/home/ansible/.kube/config:ro \
  optimode/ansible:latest \
  ansible-playbook k8s-deploy.yml
```

### Example 4: Network Device Configuration

```bash
docker run --rm \
  -v $(pwd):/workspace \
  optimode/ansible:latest \
  ansible-playbook -i network-inventory.ini configure-switches.yml
```

## Installed Packages

### Python Packages

- `ansible` - Full Ansible package with core
- `ansible-lint` - Best practices checker for Ansible
- `hvac` - HashiCorp Vault client library
- `jmespath` - JSON query language for data parsing
- `netaddr` - Network address manipulation
- `docker` - Docker SDK for Python

### System Packages

- `git` - Version control system
- `openssh-client` - SSH client for remote connections
- `sshpass` - Non-interactive SSH password authentication
- `rsync` - Fast file synchronization tool

## Troubleshooting

### Permission Issues

If you encounter permission errors with mounted volumes:

```bash
# Run as your current user
docker run --rm --user $(id -u):$(id -g) -v $(pwd):/workspace optimode/ansible:latest ansible-playbook playbook.yml

# Or fix ownership
sudo chown -R 1000:1000 /path/to/your/workspace
```

### SSH Connection Issues

Enable SSH debugging:

```bash
docker run --rm -v $(pwd):/workspace optimode/ansible:latest \
  ansible-playbook -vvv playbook.yml
```

### Collection Not Found

Verify installed collections:

```bash
docker run --rm optimode/ansible:latest ansible-galaxy collection list
```

Install missing collection:

```bash
docker run --rm optimode/ansible:latest \
  ansible-galaxy collection install namespace.collection
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Adding New Collections

To add collections to the base image, update `requirements-collections.yml` or the version-specific YAML files (`ansible-11.12.0.yaml`, `ansible-12.2.0.yaml`).

### Testing Changes

```bash
# Build locally
docker build --build-arg ANSIBLE_VERSION=12.2.0 -t test-ansible .

# Test
docker run --rm test-ansible ansible --version
docker run --rm test-ansible ansible-galaxy collection list
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Maintainer

**Laszlo Malina**
Optimode (Laszlo Malina)
GitHub: [@optimode](https://github.com/optimode)

## Resources

- [Ansible Documentation](https://docs.ansible.com/)
- [Ansible Galaxy](https://galaxy.ansible.com/)
- [HashiCorp Vault](https://www.vaultproject.io/)
- [Docker Hub](https://hub.docker.com/)

## Support

If you encounter issues or have questions:

1. Check the [Troubleshooting](#troubleshooting) section
2. Review [Ansible documentation](https://docs.ansible.com/)
3. Open an issue on [GitHub](https://github.com/optimode/ansible/issues)

---

**Built with** ❤️ **by Optimode**
