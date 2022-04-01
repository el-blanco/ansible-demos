# NTP

Install NTP on Debian/Ubuntu systems and optionally point them to your own NTP server(s)

---

## Usage
```bash
~$ ansible-playbook.yml -i inventory.yml main.yml
```

## Example Inventory
Build your own inventory, either manually or by running `setup.sh` script

```yaml
---
all:
  hosts:
    host1:
    host2:
    hostA:
    hostB:
  vars:
    ntp_servers:
      - ntp1.foo.net
      - ntp2.foo.net
```
## Attributes

Ideas borrowed from `ansible-galaxy: wrboyce.ntp`

## Author Information

* David White

