# ⚠️ DEPRECATION WARNING: This deployment method is no longer supported.

For all new installs please refer to the [charts-clickhouse](https://github.com/PostHog/charts-clickhouse) repository, which contains instructions on how to deploy ClickHouse-backed PostHog.

The last version of PostHog supported with this chart is 1.29.0.

# PostHog Charts

This repository contains Helm charts for PostHog backed by Postgres.

```bash
helm repo add posthog https://posthog.github.io/charts/
helm repo update
helm install posthog posthog/posthog
```

**NOTE: If Helm hangs while installing this chart, try increasing the memory of your nodes.**

As a baseline we suggest having at least 4 GB of memory per node.

## GitHub Actions

We have an action to create new releases automatically. On pushes to `master`, it checks that the version was bumped and then:

- Creates a GitHub release from the tag
- Pushes a new release to https://posthog.github.io/charts/

If the bot fails to create a release, take a look at the [upstream action repo](https://github.com/helm/chart-releaser-action) to see if there were any breaking changes.

## Questions?

### [Join our Slack community.](https://join.slack.com/t/posthogusers/shared_invite/enQtOTY0MzU5NjAwMDY3LTc2MWQ0OTZlNjhkODk3ZDI3NDVjMDE1YjgxY2I4ZjI4MzJhZmVmNjJkN2NmMGJmMzc2N2U3Yjc3ZjI5NGFlZDQ)
