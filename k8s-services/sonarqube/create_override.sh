#!/bin/bash
helm show values sonarqube/sonarqube --version 8.0.0+463 > override-default.yaml
