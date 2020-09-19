#!/bin/sh
echo "hashicorp status:"
helm status hashicorp
echo "all hashicorp status:"
helm get all hashicorp

