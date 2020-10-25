export PACKER_LOG=1
packer build -force -var-file=variables.json ubuntu20.json
