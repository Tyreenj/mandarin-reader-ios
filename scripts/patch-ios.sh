#!/usr/bin/env bash
# Allow plain-HTTP servers (home LAN / Tailscale IPs), local-network access, and set the app icon.
set -euo pipefail
PLIST="ios/App/App/Info.plist"
PB=/usr/libexec/PlistBuddy
$PB -c "Delete :NSAppTransportSecurity" "$PLIST" 2>/dev/null || true
$PB -c "Add :NSAppTransportSecurity dict" "$PLIST"
$PB -c "Add :NSAppTransportSecurity:NSAllowsArbitraryLoads bool true" "$PLIST"
$PB -c "Add :NSAppTransportSecurity:NSAllowsLocalNetworking bool true" "$PLIST"
$PB -c "Add :NSLocalNetworkUsageDescription string 'Connect to your Mandarin Reader server on your local network.'" "$PLIST" 2>/dev/null || true
$PB -c "Set :CFBundleDisplayName 'Mandarin Reader'" "$PLIST" 2>/dev/null || true
# iPad: allow all orientations
cp assets/icon-1024.png ios/App/App/Assets.xcassets/AppIcon.appiconset/AppIcon-512@2x.png
echo "Patched Info.plist and icon"
