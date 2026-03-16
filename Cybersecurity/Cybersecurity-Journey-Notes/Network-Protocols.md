## Network Protocols: TCP/IP, HTTP, DNS

### TCP/IP

A suite of protocols governing data transmission over the internet.

**Key functions:**
- Breaks data into packets
- Addresses and routes packets
- Ensures reliable delivery at destination

**Characteristics:**
- Hardware/software agnostic
- Layered architecture
- Foundation of internet communication

### TCP/IP Layered Model

| Layer | Function | Key Protocols |
|-------|----------|---------------|
| Application | Network services to apps | HTTP, HTTPS, SMTP, FTP, DNS |
| Transport | End-to-end data delivery | TCP, UDP |
| Internet | Addressing & routing | IP (IPv4, IPv6) |
| Network Access | Physical transmission | Ethernet, Wi-Fi, PPP |

#### Transport Layer: TCP vs UDP

| Feature | TCP | UDP |
|---------|-----|-----|
| Connection | Connection-oriented | Connectionless |
| Reliability | Guaranteed delivery | Best-effort |
| Ordering | Maintained | Not guaranteed |
| Use Cases | Web, email, file transfer | Streaming, gaming, VoIP |

**TCP 3-Way Handshake:** SYN → SYN-ACK → ACK

#### Internet Layer

- **IP Addressing:** Unique device identifiers (IPv4: 32-bit, IPv6: 128-bit)
- **Routing:** Routers forward packets using routing tables
- **Fragmentation:** Large packets split for transmission, reassembled at destination

#### Network Access Layer

- **MAC Addressing:** Hardware identifier for each NIC
- **Ethernet:** Wired network standard
- **Wi-Fi:** Wireless transmission via radio waves

---

### HTTP & HTTPS

Application layer protocols for web communication. HTTP is stateless (each request is independent).

#### HTTP Methods

| Method | Purpose |
|--------|---------|
| GET | Retrieve data |
| POST | Create/submit data |
| PUT | Replace resource |
| PATCH | Partial update |
| DELETE | Remove resource |

#### Common Status Codes

| Code | Meaning |
|------|---------|
| 200 | OK - Success |
| 301 | Moved Permanently |
| 404 | Not Found |
| 500 | Internal Server Error |

#### HTTP vs HTTPS

| Feature | HTTP | HTTPS |
|---------|------|-------|
| Security | Unencrypted | SSL/TLS encrypted |
| Port | 80 | 443 |
| Use Cases | Non-sensitive content | Sensitive data, transactions |

#### HTTPS Security Components

- **SSL/TLS:** Cryptographic protocols for secure communication
- **Digital Certificates:** Issued by Certificate Authorities (CA) to verify server identity
- **Encryption Process:** Client verifies cert → encrypts with public key → server decrypts with private key

---

### DNS (Domain Name System)

Translates human-readable domain names (e.g., google.com) into IP addresses (e.g., 172.217.160.142). Often called the "phonebook of the internet."

#### DNS Resolution Process

1. **Browser Cache** → Check local browser cache
2. **OS Cache** → Check operating system DNS cache
3. **Recursive DNS Server** → Query ISP's DNS server
4. **Root DNS Server** → Directs to appropriate TLD server
5. **TLD DNS Server** → Directs to authoritative server (.com, .org, .net)
6. **Authoritative DNS Server** → Returns actual IP address
7. **Response & Caching** → IP returned to client and cached

#### DNS Record Types

| Record | Purpose | Example |
|--------|---------|---------|
| A | Maps domain to IPv4 address | example.com → 192.0.2.1 |
| AAAA | Maps domain to IPv6 address | example.com → 2001:db8::1 |
| CNAME | Creates alias for domain | www.example.com → example.com |
| MX | Specifies mail servers | example.com → mail.example.com |
| TXT | Stores text data (SPF, verification) | "v=spf1 mx -all" |
| NS | Specifies authoritative name servers | ns1.example.com |
| SOA | Zone authority info (primary NS, admin) | Zone serial, refresh times |

#### DNS Hierarchy

| Level | Description |
|-------|-------------|
| Root Servers | 13 logical servers (A-M) worldwide, direct to TLDs |
| TLD Servers | Manage top-level domains (.com, .org, .net) |
| Authoritative Servers | Store actual DNS records for domains |
