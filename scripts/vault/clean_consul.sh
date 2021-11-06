#!/bin/bash
echo "Stopping vault"
systemctl stop vault

echo "Stopping consul"
systemctl stop consul

echo "Cleaning /mnt/scratch/appdata/consul/*"
rm -rf /mnt/scratch/appdata/consul/*

echo "Starting consul"
systemctl start consul

echo "Starting vault"
systemctl start vault


