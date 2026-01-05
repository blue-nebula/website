---
title: "Our first ever stable release: v1.6.1 published"
date: 2026-01-05
author: "TheAssassin"
categories:
  - release
tags:
  - release
  - github
type: posts
---

{{< figure
    src="/img/blue-actor.png"
    alt="Blue Nebula blue actor, sketch from Lagetta"
    title="Blue Nebula blue actor"
    attr="Copyright © 2021, Lagetta ([link to original work](https://www.deviantart.com/lagetta/art/Blue-Nebula-blue-actor-880789139))"
    target="_blank"
    width="500px"
>}}

We are very proud to announce our first ever stable release!

<!--more-->

Over five years after the decision to fork Red Eclipse to keep the 1.x version alive, initially under the provisional title "Red Eclipse Legacy", we proudly announce the release of [**Blue Nebula v1.6.1**](https://github.com/blue-nebula/base/releases/v1.6.1)!
Just before the UTC new year of 2025 (yes, made it!), we published the tag and had GitHub build and upload the corresponding binaries for **Windows (x86_64), Linux (x86_64/aarch64) and macOS (Apple Silicon/Intel)**.



## Download

The following binary distributions are available:

- Linux
  - ![](/img/appimage-icon.png) AppImage x86_64: [Download](https://github.com/blue-nebula/base/releases/download/v1.6.1/Blue_Nebula-v1.6.1-x86_64.AppImage)
  - ![](/img/appimage-icon.png) AppImage aarch64: [Download](https://github.com/blue-nebula/base/releases/download/v1.6.1/Blue_Nebula-v1.6.1-aarch64.AppImage)
  - ![](/img/flatpak-icon.png) Flatpak: [Flathub page](https://flathub.org/en/apps/org.blue_nebula.BlueNebula)
- Windows
  - 💿  Installer x64: [Download](https://github.com/blue-nebula/base/releases/download/v1.6.1/blue-nebula-v1.6.1-win64.exe)
  - 🗜️ ZIP archive x64: [Download](https://github.com/blue-nebula/base/releases/download/v1.6.1/blue-nebula-v1.6.1-win64.zip)
- macOS
  - 🗜️ ZIP archive Intel: [Download](https://github.com/blue-nebula/base/releases/download/v1.6.1/blue-nebula-v1.6.1-macos-arm64.zip)
  - 🗜️ ZIP archive ARM: [Download](https://github.com/blue-nebula/base/releases/download/v1.6.1/blue-nebula-v1.6.1-macos-arm64.zip)

**Please note: Installation and user instructions will soon be found in our [Documentation](https://docs.blue-nebula.org/).** We do not sign our releases for Windows/macOS, thus additional steps are required to use them.


## Changelog

As five years have passed since the initial fork, this section contains a curated (incomplete) list of changes done since the 1.6.0 release. For a detailed list, please see our [GitHub project](https://github.com/blue-nebula).

*(Please note that some of these changes were contributed before we forked all repositories. Therefore, some work mentioned may have been done by the Red Eclipse team and external contributors. The first commit that kicked off our fork is [this one](https://github.com/blue-nebula/base/commit/6991831815d447284c91944ee98b9b9b2917c45f).)*


### New Features

- Add support for `gno` in voices menu (thanks [@acerspyro](https://github.com/acerspyro))
- Add key binding for `space` to exit spectator (thanks [@qreeves](https://github.com/qreeves))
- Fix behavior of `screenshotnohud` variable (thanks [@qreeves](https://github.com/qreeves) and [@acerspyro](https://github.com/acerspyro))
- Completely re-worked build system based on CMake (thanks [@TheAssassin](https://github.com/TheAssassin) and [@voidanix](https://github.com/voidanix))
- Improved and unified installation based on FHS for all platforms (thanks [@TheAssassin](https://github.com/TheAssassin))
- Introduce new `chatdisabled` variable (thanks [@voidanix](https://github.com/voidanix))
- Chatkills are now recognized as undesired behaviour (thanks [@voidanix](https://github.com/voidanix))
- Chat bubble is now stacked correctly with other icons to prevent accidental chatkills (thanks [@metalune](https://github.com/metalune))
- Chat symbol is shown in radar (thanks [@metalune](https://github.com/metalune))
- Show percentage on CTF defend/capture (thanks [@voidanix](https://github.com/voidanix))
- Player name auto-completion in chat with well-known `@nick` syntax (thanks [@metalune](https://github.com/metalune))
- Improved server list search (thanks [@shacknetisp](https://github.com/shacknetisp) and [@metalune](https://github.com/metalune))
- Multiline comments in CubeScript (thanks [@metalune](https://github.com/metalune))
- Slightly improved bots (thanks Bérenger Morel)
- Official [server Docker image](https://github.com/blue-nebula/base/pkgs/container/base%2Fserver) (thanks [@TheAssassin](https://github.com/TheAssassin))


### New Maps

- `blizzard` by [@SniperGoth](https://github.com/SniperGoth)
- `sand` by [@molexted](https://github.com/molexted)
- `train` by Lyberta


### New Masterserver

[@TheAssassin](https://github.com/TheAssassin) built a new [Python Masterserver](https://github.com/TheAssassin/python-masterserver/) to serve as a replacement for the built-in masterserver (which we still provide!) for the Blue Nebula community.

But why was this necessary? Well, many compatible (Red Eclipse) servers are still published on the Red Eclipse masterserver, and Red Eclipse is still one of the main Blue Nebula-compatible clients used (it is still included in some distributions and some people also still have it installed).

We intentionally wanted to provide our own masterserver for many reasons, one of them being to enable global moderation with user accounts which requires the masterserver to authorize requests. However, that would mean breaking the community apart quicker than we wanted. After all, Blue Nebula is a community spin-off of Red Eclipse 1. We therefore thought it might be a good idea to build a bridge.

Python Masterserver therefore is a more or less transparent proxy to another masterserver, fetching the server list from there and also forwarding auth requests (unless it can handle these itself).

When using Blue Nebula (or configuring Red Eclipse with the command `servermaster master.blue-nebula.org` in your `autoexec.cfg`), users can still play on all servers published on the Red Eclipse master server. Also, Blue Nebula can feature a few servers on Red Eclipse's master server.

We believe all of this is in line with Red Eclipse's policies and the spirit of cooperating with the original project.

The Python masterserver also provides a new [HTTP endpoint](http://master.blue-nebula.org:28799/) with a server list in JSON format. We consider using JSON in the future for all masterserver communication to replace the proprietary formats currently in use.



### Bugs fixed

- Removed own RNG implementation and related bugs (e.g. `plasmapartfade 1`) (thanks [@voidanix](https://github.com/voidanix))
- Removed dependency on X11 (thanks [@voidanix](https://github.com/voidanix))
- Fixed building on OpenBSD (thanks [@TheAssassin](https://github.com/TheAssassin))
- Fixed many, many UI related bugs (thanks [@metalune](https://github.com/metalune))
- Fixed mutators for map *ubik* with defend-and-control and bomberball (thanks [@voidanix](https://github.com/voidanix))
- Fixed collision bug on map *deli* (thanks [@robalni](https://github.com/robalni))
- Fixed memleak in server list filtering (thanks [@shacknetisp](https://github.com/shacknetisp))



### Other changes

- Change references and names to Blue Nebula in all resources (various people including [@voidanix](https://github.com/voidanix) and [@TheAssassin](https://github.com/TheAssassin))
- Complete rework of CI/CD, release and distribution, first on Travis CI, later using GitHub actions (thanks [@TheAssassin](https://github.com/TheAssassin))
- Many improved user interfaces, dialogs, etc. (thanks [@metalune](https://github.com/metalune))
- Update ENet networking library (thanks [@voidanix](https://github.com/voidanix) and [@TheAssassin](https://github.com/TheAssassin))
- Greatly improved Windows installer (thanks [@TheAssassin](https://github.com/TheAssassin))
- Many code style cleanups, fixed compiler warnings etc. (thanks [@voidanix](https://github.com/voidanix), [@metalune](https://github.com/metalune), Robert Alm Nilsson, Bérenger Morel, [@shacknetisp](https://github.com/shacknetisp), [@TheAssassin](https://github.com/TheAssassin) and others)
- Remove stats database system and SQLite 3 from code base (thanks [@TheAssassin](https://github.com/TheAssassin))
- Remove then-unused movie feature (thanks Bérenger Morel)
- Ongoing attempt to integrate more with STL (thanks Bérenger Morel, [@metalune](https://github.com/metalune) and others)
- Increase server/client update rate to 125 Hz (thanks [@voidanix](https://github.com/voidanix)
- Updated AppStream data (thanks [@user1-github](https://github.com/user1-github))


## Help wanted!

We are always looking for people who want to improve Blue Nebula! We need talented mappers and designers, people who write documentation and tutorials, creators of videos, players, clans, and of course developers who know C++, Python, Cubescript (no, really!), CI/CD/DevOps, etc.

*Any* contribution matters! Please get in touch via [IRC](ircs://irc.libera.chat:6697/#blue-nebula) or [GitHub](https://github.com/blue-nebula) with us. We are always happy to talk to new and old community members and are looking forward to seeing you in-game as well!


## Acknowledgements

Since the core team currently consists of just two maintainers, [@voidanix](https://github.com/voidanix) and [@TheAssassin](https://github.com/TheAssassin), we want to thank some of the people along the way who were part of the team and/or community and have supported us in our journey to publish the first stable release of Blue Nebula:

- Morel "bmorel" Bérenger, initial co-founder and valued community member
- Benjamin "Beha" Leskey [@shacknetisp](https://github.com/shacknetisp), nowadays [linewriter1024](https://github.com/linewriter1024)
- Robert "Norakam" Alm Nilsson [@robalni](https://github.com/robalni), who contributed lots of fixes and improvements
- metalune [@metalune](https://github.com/metalune), skilled CubeScript and C++ hacker who contributed a lot of fixes across the codebase (and some of the most useful new features!)
- Laggy [@Lagetta](https://github.com/Lagetta), talented artist and player who created some artwork around the game
- ... and many more!

Also, we want to thank all players who make playing such a great experience. Although, it has grown smaller over the last few years, there still are many active players who play on a regular basis (even if regular means every couple months!). With this release, we hope to motivate some of you to come back and new players to try out the game!


## Next steps

It took us a few days to compile this blog post and so much has happened already in the meantime! A [Flatpak package](https://flathub.org/en/apps/org.blue_nebula.BlueNebula) was [contributed](https://github.com/flathub/flathub/pull/7447) by [@user1-github](https://github.com/user1-github), we published improvements to our Docker image and build system, and have a lot more planned for the next release.

We are looking forward to seeing you, our community, in-game more frequently again, and hope you are going to enjoy Blue Nebula 1.6.1!
