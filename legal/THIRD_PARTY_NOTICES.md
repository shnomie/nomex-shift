# Nomex Shift Third-Party Notices

Effective September 7, 2026 · Policy version 1.1

Nomex Shift is proprietary Nomex software. This notice identifies third-party technology used by or distributed with the current Nomex Shift Windows release. Third-party components remain governed by their own terms; the Nomex proprietary license does not replace or restrict rights granted by those licenses.

## Microsoft .NET 8 and Windows Desktop Runtime

Nomex Shift is built with .NET 8, Windows Presentation Foundation, Windows Forms interoperability, and Windows APIs. Production packages may include Microsoft .NET runtime components when published as a self-contained application.

- Provider: Microsoft Corporation and .NET Foundation contributors
- Project: [.NET](https://github.com/dotnet/runtime)
- License information: [Microsoft .NET library licensing](https://dotnet.microsoft.com/en-us/dotnet_library_license.htm)
- Notices: [.NET runtime third-party notices](https://github.com/dotnet/runtime/blob/main/THIRD-PARTY-NOTICES.TXT)

Copyright and attribution notices supplied with the applicable .NET runtime distribution must be retained with distributed builds. The precise runtime files and notices must be regenerated from the production publish output for each release.

## WiX Toolset 6.0.2

The Windows installer is produced with WiX Toolset SDK 6.0.2 and the WiX UI and Util extensions. Installer runtime components supplied by those packages may be embedded in the finished installer.

- Provider: .NET Foundation and contributors
- Project: [WiX Toolset](https://github.com/wixtoolset/wix)
- Version used by the current installer project: 6.0.2
- License: the `OSMFEULA.txt` included with each applicable WiX NuGet package

Nomex must comply with the WiX package terms in effect for the version used to build each installer, including any applicable Open Source Maintenance Fee terms. Retain the exact license file supplied by the build packages in the internal release-compliance archive.

## Windows system components

Segoe UI and Windows networking, registry, cryptography, shell, and management interfaces are supplied by Windows and are not redistributed as separately licensed Nomex assets. Their use is governed by the user's Microsoft Windows license.

## Nomex assets and data

The Nomex rocket-shaped N, logos, product names, screenshots, banner artwork, installer artwork, and other original Nomex assets are proprietary Nomex materials. They are not third-party open-source assets and may not be extracted or redistributed separately.

Nomex Shift can retrieve IEEE organizationally unique identifier data when a user requests that feature. The downloaded registry is not committed to this repository and is not presented as Nomex-owned data. Use and redistribution remain subject to the source provider's terms.

## Release-maintainer requirement

Before every release, compare the final installer contents against the private build's dependency manifests. Update this file if any third-party package, runtime, font, icon set, data set, media file, or installer component was added, removed, or upgraded. A package name appearing in a build tool's cache does not by itself mean that package is distributed with Nomex Shift.

Questions about these notices may be submitted using [`SUPPORT.md`](../SUPPORT.md).
