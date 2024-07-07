# Strimzi on OpenShift Local

Install and configure OpenShift Local: <https://developers.redhat.com/products/openshift-local/overview>

> Note: Requires a Red Hat account to be able to download and get an image pull key

> Note 2: If running on Windows, requires that you install all Hyper-V features in Windows including "Hyper-V Management Services"

> Note 3: If you are using WSL with `wsl-vpnkit` then there is a conflict with port 2222; you need to fix `wsl-vpnkit` to use a different port before you can run OpenShift Local.

```sh
crc setup
# start crc with extra cpu, memory, and disk
crc start -c 8 -m 18000 -d 120
```

> Note 4: You can use the Hyper-V Manager tool in Windows to monitor resources of the `crc` virtual machine.

1. Install the following operators from OperatorHub (it might take a bit before OperatorHub is fully functioning, and for the list to download; just wait a few minutes!):
    - cert-manager
    - Strimzi
    - Apicurio Registry Operator

2. Create a namespace e.g. `kafka` to hold the Kafka services which will be used by other namespaces

3. Within the `kafka` namespace, add the following (see files in the repo):
    1. `kafka-single-replica.yaml` (Kafka cluster)
    2. `connect.yaml` (Connect user + cluster)
    3. `apicurio-registry.yaml` (Apicurio Registry); access the registry's GUI via <http://apicurio-registry.kafka.router-default.apps-crc.testing/>, API Docs via <http://apicurio-registry.kafka.router-default.apps-crc.testing/apis>
    4. `kafka-ui.yaml` (Kafka-UI, see <https://github.com/provectus/kafka-ui>); access the GUI via <http://kafka-ui-kafka.apps-crc.testing/>

4. Test different connectors using the files `sample-connector-*.yaml` to see how it works to use Apicurio Registry with connect either via the Apicurio AvroConverter or using the Confluent AvroConverter via Apicurio's Confluent-compatible Schema Registry API endpoint

5. (optional) Add additional CA certs to the `openshift-config/registry-certs` ConfigMap if you want to pull images from other image repositories (see `user-ca-bundle.yaml` for example that works with Karolinska's Artifactory)

6. (optional) Add additional hosts/tokens to the the secret `openshift-config/pull-secret` (manually create a new Image pull secret using the OpenShift GUI for an example you can just copy/paste)
