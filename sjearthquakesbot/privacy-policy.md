---
layout: default
title: Privacy Policy
permalink: /sjearthquakesbot/privacy-policy
---

<!-- Synced from jbburgess/sjearthquakesbot/docs/privacy-policy.md. Do not edit here. -->



**Effective date:** July 15, 2026

This Privacy Policy describes how the **r/SJEarthquakes Bot** ("the app", "the bot")
processes information when it is installed and operated on a subreddit. The bot is an
open-source moderation tool built on Reddit's [Devvit](https://developers.reddit.com/)
platform and is not affiliated with, endorsed by, or operated by the San Jose Earthquakes,
Major League Soccer, or ESPN.

## Who operates the app

The app is developed and maintained by the Reddit user
[`u/jbburgess`](https://www.reddit.com/user/jbburgess). For any privacy-related questions
or data requests, contact the maintainer via Reddit at
[`u/jbburgess`](https://www.reddit.com/user/jbburgess).

## What data the app processes

The bot processes only the data required to perform its moderation functions:

- **Public subreddit content** — posts, comments, flairs, and thread metadata that the bot
  reads or creates in the course of managing match-day threads, news posts, and voting
  threads.
- **Moderator-configured settings** — configuration values that moderators set for the bot
  (for example, the ESPN team ID, flair selections, timing options, and news controls).
  These are stored via Devvit's built-in settings and data storage on Reddit's
  infrastructure.
- **Externally fetched content** — publicly available schedule, fixture, match, and news
  data retrieved from third-party sources (see "External data sources" below). This content
  is used to populate the threads the bot posts and is not tied to individual Reddit users.

The bot does **not** collect, request, or store personal information such as email
addresses, passwords, payment details, IP addresses, or precise location data.

## How data is used

Processed data is used solely to:

- Create and update pre-match, match, post-match, Man of the Match, ticket, and news threads.
- Apply link flair and sticky/un-sticky/lock threads at the appropriate times.
- Manage Man of the Match nomination comments during the voting window.

The app does not use processed data for advertising, profiling, or resale, and does not
share data with third parties except as necessary to make the read-only external requests
described below.

## Data storage and retention

- Configuration and operational state are stored using Devvit's data storage (Redis) and
  settings, hosted on Reddit's infrastructure, for as long as the app is installed on a
  subreddit.
- Content created by the bot (posts and comments) is subject to Reddit's own retention and
  moderation policies.
- Uninstalling the app from a subreddit stops all further data processing by the bot.

## External data sources

The bot makes server-side, read-only (`HTTP GET`) requests to the following third-party
domains to gather public information used in its posts:

- `site.api.espn.com` — team schedule, fixtures, and live/post-match details (scores,
  events, lineups, and player performance statistics).
- `sjearthquakes.com` — official San Jose Earthquakes club news and announcements.

These external services are operated by third parties and are governed by their own privacy
policies. The bot does not send any Reddit user data to these services.

## Children's privacy

The app is a subreddit moderation tool and is not directed to children. It does not
knowingly collect personal information from anyone, including children.

## Changes to this policy

This policy may be updated from time to time. Material changes will be reflected by updating
the "Effective date" above and the version published in the app's repository.

## Contact

For privacy questions or data requests, contact
[`u/jbburgess`](https://www.reddit.com/user/jbburgess) on Reddit.
