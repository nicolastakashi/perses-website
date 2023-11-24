#!/usr/bin/env bash

set -xe

rm -rf repos/
mkdir repos/

##TODO: Change to perses repo before merge
if [[ -z "$USE_LOCAL_REPOSITORIES" ]]; then
  git clone https://github.com/nicolastakashi/perses -b main --depth 1 repos/perses
else
  # Check the operating system
  if [[ $(uname) == "Darwin" ]]; then
    # macOS: Use a different relative path
    ln -s ../../perses repos/perses
  else
    # Assume other Unix-like systems
    ln -s ../perses repos/perses
  fi
fi

for r in repos/perses; do
  echo "$r -> ""$(cd $r && git rev-parse HEAD)"
done



# main section + images
# cp repos/prometheus-operator/ADOPTERS.md content/adopters.md
# cp -r repos/prometheus-operator/Documentation/img static/img

# # prologue section
cp -R repos/perses/CONTRIBUTING.md content/docs/prologue/contributing.md
cp -R repos/perses/docs/user/section-1.md content/docs/prologue/section-1.md

## Perses API
cp -R repos/perses/docs/api/README.md content/docs/perses/api/README.md
cp -R repos/perses/docs/api/project.md content/docs/perses/api/project.md
cp -R repos/perses/docs/api/datasource.md content/docs/perses/api/datasource.md
cp -R repos/perses/docs/api/dashboard.md content/docs/perses/api/dashboard.md
cp -R repos/perses/docs/api/secret.md content/docs/perses/api/secret.md
cp -R repos/perses/docs/api/user.md content/docs/perses/api/user.md
cp -R repos/perses/docs/api/variable.md content/docs/perses/api/variable.md
cp -R repos/perses/docs/api/role.md content/docs/perses/api/role.md
cp -R repos/perses/docs/api/rolebinding.md content/docs/perses/api/rolebinding.md

# # user guides section
# cp repos/prometheus-operator/Documentation/user-guides/getting-started.md content/docs/user-guides/getting-started.md
# cp repos/prometheus-operator/Documentation/user-guides/alerting.md content/docs/user-guides/alerting.md
# cp repos/prometheus-operator/Documentation/user-guides/prometheus-agent.md content/docs/user-guides/prometheus-agent.md
# cp repos/prometheus-operator/Documentation/user-guides/scrapeconfig.md content/docs/user-guides/scrapeconfig.md
# cp repos/prometheus-operator/Documentation/user-guides/webhook.md content/docs/user-guides/webhook.md

# # prometheus-operator section
# cp repos/prometheus-operator/Documentation/api.md content/docs/operator/api.md
# cp repos/prometheus-operator/Documentation/operator.md content/docs/operator/operator.md
# cp repos/prometheus-operator/Documentation/compatibility.md content/docs/operator/compatibility.md
# cp repos/prometheus-operator/Documentation/design.md content/docs/operator/design.md
# cp repos/prometheus-operator/Documentation/high-availability.md content/docs/operator/high-availability.md
# cp repos/prometheus-operator/Documentation/rbac-crd.md content/docs/operator/rbac-crd.md
# cp repos/prometheus-operator/Documentation/rbac.md content/docs/operator/rbac.md
# cp repos/prometheus-operator/Documentation/thanos.md content/docs/operator/thanos.md
# cp repos/prometheus-operator/Documentation/troubleshooting.md content/docs/operator/troubleshooting.md
# cp repos/prometheus-operator/Documentation/user-guides/storage.md content/docs/operator/storage.md
# cp repos/prometheus-operator/Documentation/user-guides/strategic-merge-patch.md content/docs/operator/strategic-merge-patch.md

# # kube-prometheus section
# cp repos/kube-prometheus/docs/blackbox-exporter.md content/docs/kube/blackbox-exporter.md
# cp repos/kube-prometheus/docs/deploy-kind.md content/docs/kube/deploy-kind.md
# cp repos/kube-prometheus/docs/customizations/developing-prometheus-rules-and-grafana-dashboards.md content/docs/kube/developing-prometheus-rules-and-grafana-dashboards.md
# cp repos/kube-prometheus/docs/customizations/exposing-prometheus-alertmanager-grafana-ingress.md content/docs/kube/exposing-prometheus-alertmanager-grafana-ingress.md
# cp repos/kube-prometheus/docs/kube-prometheus-on-kubeadm.md content/docs/kube/kube-prometheus-on-kubeadm.md
# cp repos/kube-prometheus/docs/monitoring-external-etcd.md content/docs/kube/monitoring-external-etcd.md
# cp repos/kube-prometheus/docs/monitoring-other-namespaces.md content/docs/kube/monitoring-other-namespaces.md