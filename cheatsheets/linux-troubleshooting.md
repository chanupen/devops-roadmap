# Linux troubleshooting

## First five minutes on a slow host

```bash
uptime                      # load averages
dmesg -T | tail -n 20       # kernel errors, OOM kills
vmstat 1 5                  # run queue, memory, swap, CPU
iostat -xz 1 3              # disk utilisation and latency
free -h                     # memory
ss -s                       # socket summary
top -o %CPU                 # top processes
```

## Services

```bash
systemctl status <unit>
journalctl -u <unit> -n 50 --no-pager
journalctl -u <unit> --since "10 min ago" -f
systemctl list-units --failed
```

## Disk

```bash
df -h            # space
df -i            # inodes
du -xh / --max-depth=1 2>/dev/null | sort -h | tail
lsof +L1         # deleted files still held open
```

## Network

```bash
ss -tulpn                   # listening ports and owners
dig +short example.com
curl -v https://example.com
openssl s_client -connect example.com:443 -servername example.com </dev/null
```
