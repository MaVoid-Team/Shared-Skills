---
name: cloudflare-dns
description: "Manage Cloudflare DNS records for Ziad's domains and Hostinger VPS instances. Use for: adding A records, mapping VPS nicknames to IP addresses, and selecting Cloudflare zones."
---

# Cloudflare DNS Management Skill

This skill automates the process of adding DNS records to Ziad's Cloudflare account, specifically mapping subdomains to his Hostinger VPS instances.

## Core Knowledge

### VPS Inventory
Refer to `/home/ubuntu/skills/cloudflare-dns/references/vps_inventory.md` for the full list of VPS nicknames and IP addresses.

| Nickname | IP Address | Primary Use |
| :--- | :--- | :--- |
| **MaVoid** | `46.202.130.203` | Main VPS for most websites. |
| **Liwan** | `69.62.120.176` | Real Estate Developments. |
| **Kalima** | `82.29.175.176` | Advanced E-Commerce client. |

### Domain Logic
- **Automatic Domain Selection**: If a record like `A-football.mavoid.com` is requested, identify the root domain as `mavoid.com`.
- **Default Settings**:
  - **Record Type**: Always `A` record unless specified otherwise.
  - **Proxy**: **OFF** (False) by default, unless explicitly requested to be ON.
  - **TTL**: **Auto** (1).

## Workflow

1. **Identify the Target Domain and VPS**:
   - Extract the root domain from the requested record name.
   - Map the requested VPS nickname to its IP address using the inventory.

2. **Retrieve the Cloudflare Zone ID**:
   - Run the zone lookup script:
     ```bash
     python3 /home/ubuntu/skills/cloudflare-dns/scripts/get_zone_id.py <root_domain>
     ```

3. **Add the DNS Record**:
   - Use the `add_dns_record.py` script with the retrieved Zone ID, the full record name, the VPS IP, and the proxy setting:
     ```bash
     python3 /home/ubuntu/skills/cloudflare-dns/scripts/add_dns_record.py <zone_id> <record_name> <ip_address> <proxied_bool>
     ```

## Examples

### Example 1: Adding a record to MaVoid VPS
**User**: "Make a new dns record for A-football.mavoid.com on VPS MaVoid"
1. **Root Domain**: `mavoid.com`
2. **IP**: `46.202.130.203` (from MaVoid nickname)
3. **Proxy**: `False` (default)
4. **Action**:
   - `python3 /home/ubuntu/skills/cloudflare-dns/scripts/get_zone_id.py mavoid.com` -> returns `ZONE_ID`
   - `python3 /home/ubuntu/skills/cloudflare-dns/scripts/add_dns_record.py ZONE_ID A-football.mavoid.com 46.202.130.203 False`

### Example 2: Adding a record with Proxy ON
**User**: "Add sub.liwan.com to Liwan VPS and turn on the proxy"
1. **Root Domain**: `liwan.com`
2. **IP**: `69.62.120.176` (from Liwan nickname)
3. **Proxy**: `True` (explicitly requested)
4. **Action**:
   - `python3 /home/ubuntu/skills/cloudflare-dns/scripts/get_zone_id.py liwan.com` -> returns `ZONE_ID`
   - `python3 /home/ubuntu/skills/cloudflare-dns/scripts/add_dns_record.py ZONE_ID sub.liwan.com 69.62.120.176 True`

