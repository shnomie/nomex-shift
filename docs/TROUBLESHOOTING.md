# Troubleshooting and Recovery

## The address did not change

- Confirm the selected adapter is the intended physical adapter.
- Generate or enter a valid locally administered unicast address.
- Approve administrator elevation when Windows requests it.
- Check the adapter's driver settings; some drivers do not permit overrides.
- Restart Shift, refresh adapters, and try once more. Repeated rapid retries are not recommended.

## Windows could not disable or re-enable the adapter

Windows or the driver may reject the restart operation. Refresh adapter status, reconnect manually through Windows, and use **Restore Original** if the adapter remains unavailable. Reboot Windows if the driver is stuck. Do not repeatedly disable a remote-management adapter that is your only connection.

## Network connectivity did not return

1. Open **Restore Original**.
2. If normal startup is unreliable, launch **Nomex Shift (Safe Mode)**.
3. Use **Emergency Restore**.
4. Reboot Windows and confirm DHCP is enabled where appropriate.
5. Update or reinstall the adapter driver using the hardware manufacturer's official package.

## The installer or update was blocked

Verify the download source, SHA-256, and advertised Authenticode signature. Do not disable security software merely to run an unverified file. Submit the exact Windows warning and release version to official support.

## Premium is not active

Check internet access, system date/time, device limits, and license status. Never post the complete key publicly. Use private support for account or key recovery.
