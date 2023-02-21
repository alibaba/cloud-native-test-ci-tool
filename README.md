# cloud-native-test-ci-tool

This action uses Helm and KubeVela to deploy applications and execute E2E tests in Kubernetes.
KubeVela needs to be installed in Kubernetes before use.

# Usage

<!-- start usage -->
## Use helm chart to deploy your app in Kubernetes
```yaml
  - uses: alibaba/cloud-native-test-ci-tool@v1
    name: Deploy
    with:
      action: "deploy"
      ask-config: "${{ secrets.KUBE_CONFIG }}"
      test-version: "v1.0"
      chart-git: "https://github.com/your-helm-chart.git"
      chart-branch: "main"
      chart-path: "."
      job-id: 1
      helm-values: |
        app:
          image:
            repository: ${{env.DOCKER_REPO}}
            tag: v1.0
```
## Execute your E2E test
```yaml
  - uses: alibaba/cloud-native-test-ci-tool@v1
    name: e2e test
    with:
      action: "test"
      ask-config: "${{ secrets.KUBE_CONFIG }}"
      test-version: "v1.0"
      test-code-git: "https://github.com/your-e2e-test.git"
      test-code-branch: "main"
      test-code-path: ./
      test-cmd: "your test command"
      job-id: 1
  - uses: actions/upload-artifact@v3
    if: always()
    name: Upload test log
    with:
      name: testlog.txt
      path: testlog.txt
```
## Clean your app in Kubernetes
```yaml
  - uses: alibaba/cloud-native-test-ci-tool@v1
    name: clean
    with:
      action: "clean"
      ask-config: "${{ secrets.KUBE_CONFIG }}"
      test-version: "v1.0"
      job-id: 1
```
<!-- end usage -->

# License
[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) Copyright (C) Apache Software Foundation