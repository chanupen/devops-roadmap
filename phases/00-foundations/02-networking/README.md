# Networking for operators

> Status: planned

## Why it matters

Half of all "the app is down" reports are DNS, TLS or a firewall.

## Core concepts

- OSI and TCP/IP layers in practice
- DNS resolution end to end, `dig` and `/etc/resolv.conf`
- TCP handshake, ports, `ss`, `tcpdump`
- TLS certificates, chains and `openssl s_client`
- HTTP status codes, headers and `curl -v`
- Load balancers, NAT and firewalls (`firewalld`, `nftables`)

## In a real team

*To be written: common patterns, mistakes, and how this fits with the rest of the platform.*

## Labs

1. Diagnose a DNS failure with `dig` *(planned)*
2. Find why a TLS handshake fails (expired cert, wrong chain, wrong SNI) *(planned)*

See [`exercises.md`](exercises.md) for break-and-fix tasks and
[`interview-questions.md`](interview-questions.md) for review.

## Done when

- [ ] Trace a request from browser to backend and name every hop
- [ ] Read a `tcpdump` capture of a TCP handshake
- [ ] Inspect and explain a certificate chain
