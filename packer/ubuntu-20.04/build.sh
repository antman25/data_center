export PACKER_LOG=1
packer build -var-file=variables.json ubuntu18.fix.json
