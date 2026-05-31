# Cisco Packet Tracer

## Installation
- Refer to official documentation for setup instructions.

---

## Hubs
- **Layer:** OSI Layer 1 (Physical).
- **Topology:** Star topology.
- **Function:** Broadcasts incoming packets to all ports; every connected device receives the data.

### Simulation Steps
1. Add a Hub and multiple PCs to the workspace.
2. Connect devices using **Ethernet straight-through** cables.
3. Assign IP addresses to each PC.
4. Verify connectivity using the `ping` command.
5. Use **Simulation Mode** to observe broadcasting behavior.

### Pros
- Inexpensive.
- Simple for small networks.

### Cons
- **Network Flooding:** Excessive broadcasting impacts performance.
- **No Memory:** Does not store MAC addresses or device info.
- **Half-Duplex:** Cannot send and receive data simultaneously.
- **Legacy:** Mostly replaced by modern switches.

---

## Switches
- **Layer:** OSI Layer 2 (Data Link).
- **Topology:** Star topology.
- **Function:** Connects devices on a LAN. Stores MAC address table and forwards data only to the intended destination.

### Simulation Steps
1. Add a Cisco 2960 Switch and multiple PCs to the workspace.
2. Connect devices using **Ethernet straight-through** cables.
3. Assign IP addresses to each PC.
4. Verify connectivity using the `ping` command.
5. Use **Simulation Mode** to observe unicast behavior.

### Pros
- Intelligent data forwarding (unicast, multicast, broadcast).
- Stores MAC address tables.
- Full-duplex mode.
- More efficient and secure than hubs.

### Cons
- More expensive than hubs.
- More complex configuration.

---

## Routers
- **Layer:** OSI Layer 3 (Network).
- **Function:** Forwards data packets between different networks (LANs, WANs, or LAN to ISP).
- **Interfaces:** Minimum two interfaces—one for internal LAN, one for external network.
- **Memory:** Stores routing table for forwarding decisions based on IP addresses.

### How Routers Work
1. Device in LAN A sends data destined for LAN B.
2. Data is sent to the router's interface (default gateway).
3. Router checks routing table for destination network.
4. Router forwards data through appropriate interface to LAN B.

### Simulation Steps
1. Add a Router and Switches to the workspace.
2. Connect switches to router interfaces using **Ethernet straight-through** cables.
3. Assign IP addresses to router interfaces (these become default gateways).
4. Configure PCs with IP addresses and default gateway.
5. Verify connectivity using the `ping` command across networks.

---

## Comparison Tables

### Hub vs. Switch

| Feature | Hub | Switch |
|---------|-----|--------|
| **OSI Layer** | Layer 1 (Physical) | Layer 2 (Data Link) |
| **Memory** | None | Stores MAC Address Table |
| **Intelligence** | Not intelligent | Intelligent |
| **Data Forwarding** | Broadcasts to all ports | Unicast, multicast, broadcast |
| **Security** | High risk | Low risk |
| **Efficiency** | Less efficient | More efficient |
| **Duplex Mode** | Half Duplex | Full Duplex |

### Switch vs. Router

| Feature | Switch | Router |
|---------|--------|--------|
| **OSI Layer** | Layer 2 (Data Link) | Layer 3 (Network) |
| **Memory** | MAC Address Table | Routing Table |
| **Addressing** | MAC addresses | IP addresses |
| **Connectivity** | Devices within same LAN | Different LANs/WANs |
| **Function** | Forwards frames | Routes packets |
