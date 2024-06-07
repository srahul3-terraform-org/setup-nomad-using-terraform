# setup-nomad-using-terraform

SSH to the nomad server and run below commands to retrieve the nomad token
```sh
export CONSUL_TOKEN=<check tf output>
export LB_ADDRESS=<check tf output>
NOMAD_TOKEN=$(curl -s --header "Authorization: Bearer ${CONSUL_TOKEN}" "${LB_ADDRESS}:8500/v1/kv/nomad_user_token?raw")
echo $NOMAD_TOKEN
************************
```