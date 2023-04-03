helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
helm repo update
helm upgrade --install -n sonarqube sonarqube sonarqube/sonarqube --create-namespace --version 8.0.0+463 -f dev.yaml
