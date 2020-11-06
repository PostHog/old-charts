# Posthog Charts

This repository contains helm charts for PostHog:

* [PostHog](https://github.com/PostHog/charts/blob/master/charts/posthog/README.md)

```shell script
helm repo add posthog https://posthog.github.io/charts/
helm repo update
helm install posthog posthog/posthog
```

**NOTE - If Helm hangs while installing this chart try increasing the memory of your nodes**

As a baseline we suggest having at least 4gb of memory per node


## GitHub Actions

We have an action to create releases when a new tag is pushed. This will trigger if tags follow our version pattern, defined as `*.*.*` for simplicity.

The action will: 

- Create a GitHub release from the tag
- Push a new release to Helm 