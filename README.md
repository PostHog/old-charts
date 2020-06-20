# Posthog Charts

This repository contains helm charts for PostHog:

* [PostHog](https://github.com/PostHog/charts/blob/master/charts/posthog/README.md)

```shell script
helm repo add posthog https://posthog.github.io/charts/
helm repo update
helm install posthog posthog/posthog
```

**NOTE - If while installing this chart helm hangs try increasing the memory of your nodes**

As a baseline we suggest having at least 4gb of memory per node
