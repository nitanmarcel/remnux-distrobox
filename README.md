# remnux-distrobox

Docker container with REMnux compatible with Distrobox. Made mostly for my personal use since the official docker images are old.
And due to newer kernel versions not being available on 20.04 which is required for REMnux.

## Version
- v2025.9.1

## Install

```
distrobox create --name REMnux --image marcelalexandrunitan/remnux-distrobox:202591
distrobox enter REMnux
```

## Post-Install

- At the creation of the image, an user `remnux` is being passed to `remnux-cli`. You can copy the files saved in `/home/remnux` into your actual user or leave it as it is.

```
 remnux
├──  .config
│   └──  Code
│       └──  User
│           └──  settings.json
├──  .cpan
├──  .curlrc
├──  .dbus
├──  .ghidra
│   ├──  .ghidra_10.1.1_PUBLIC
│   │   ├──  preferences
│   │   └──  tools
│   │       ├──  _code_browser.tcd
│   │       └──  '_version _tracking.tcd'
│   └──  gdt
│       ├──  ntddk_32.gdt
│       ├──  ntddk_64.gdt
│       ├──  readme.txt
│       ├──  winapi_32.gdt
│       └──  winapi_64.gdt
├──  .malwapi.conf
```

- `remnux update`, `remnux upgrade` might fail if you encounter the same issue as me, where your distro kernel version is not available anymore on 20.04. In that case check this repo for any updates.

