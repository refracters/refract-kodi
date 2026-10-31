# Refract for Kodi

A Kodi service add-on (`service.refract`) that marks what you watch in Kodi as watched on
[Refract](https://getrefract.app): when an episode or a movie ends, your progress, diary and stats
update without a tap.

## Status

Version 0.1.0, not released. It relies on two pieces of Refract's public API that are not live yet:
the lookup by external id (`GET /v1/search/{tmdb|imdb|tvdb}/{id}`) and the add-on's client
metadata document (`https://getrefract.app/developers/clients/kodi.json`).

## What it does

- **Connect once** from the add-on settings: Kodi shows a short code, you approve it on
  getrefract.app/device from your phone or computer (OAuth 2.0 device authorization grant).
  The add-on is a public client and holds no secret.
- **Marks finished plays only.** A play counts once its furthest position passes the threshold
  (90 % by default); a partial play writes nothing. Movies are logged with an `Idempotency-Key`, so a
  retry never logs a play twice.
- **Matches by ids, never by title.** An episode by its own TMDB, TheTVDB or IMDb id, else by its
  show's id with Kodi's season and episode numbers (TheTVDB numbering when the library was scraped
  from TheTVDB). A movie by its TMDB or IMDb id. Items without ids (most streams) are skipped.

Settings: mark episodes, mark movies, threshold, notification.

## Install for testing

```sh
./build.sh
```

Then in Kodi: Settings › Add-ons › Install from zip file › `dist/service.refract-<version>.zip`.

## Requirements

Kodi 19 (Matrix) or later. Standard library only: no dependency from the Kodi repository.

## Licence

GPL-2.0-or-later, see [LICENSE](LICENSE).
