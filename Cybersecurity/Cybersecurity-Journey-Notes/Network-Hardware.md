# Network Hardware: Routers, Switches, and Modems

Network hardware directs traffic, manages connections, and translates signals so devices can communicate.

## Modems
**Modems** (Modulator-Demodulator) translate signals between digital and analog forms.
- **Modulation**: Converts **digital** data into **analog** wave patterns.
- **Demodulation**: Converts **analog** signals back to **digital**.

### Types of Modems
1. **Dial-up**: Uses **telephone lines**. Oldest type, max speed **~56kbps**.
2. **DSL** (Digital Subscriber Line): Uses telephone lines with advanced modulation. Speeds **>100Mbps**; varies by distance from ISP.
3. **Cable**: Uses **coaxial cables** (TV lines). Speeds from tens to hundreds of Mbps. Bandwidth is **shared** with neighbors.
4. **Fiber Optic** (ONTs): Uses **light** via glass/plastic strands. High speeds up to **1Gbps**.

### Modem Configuration
Requires ISP-specific settings:
- **MAC Address Registration**
- **IP Address Assignment**
- **Authentication**

### Exercises
1. Research local ISP modem types (speed, price, technology).
2. Locate your modem's MAC address and explain its role in network identification.

---

## Switches
A **Switch** connects multiple devices (computers, printers) within a **LAN**, unlike a modem which connects to the internet.

### Operation
Switches operate at **Layer 2 (Data Link Layer)** and use **MAC addresses** to forward data.
- **Unicasting**: Forwards packets *only* to the specific port of the destination device.
- **MAC Address Table**: Dynamically maps **MAC addresses** to **ports**.
- **Learning**: Records source MAC and port upon receiving data.
- **Flooding**: If the destination MAC is unknown, sends the packet to **all ports** (except sender) to find the device.

### Types of Switches
* **Unmanaged**: Plug-and-play, no configuration. Common in **home/small offices**.
* **Managed**: Configurable for security and control. Common in **enterprise networks**.

### Managed Switch Features
- **VLANs** (Virtual LANs): Segments physical network into logical networks for **security** and **traffic isolation**.
- **QoS** (Quality of Service): Prioritizes specific traffic (e.g., **VoIP**, **Video**) to ensure bandwidth.
- **Port Mirroring**: Duplicates traffic to another port for **monitoring** and **troubleshooting**.
- **SNMP** (Simple Network Management Protocol): Monitors device **performance** and **health**.

### Exercises
1. Diagram a 5-computer network connected by a switch; trace MAC address learning and packet forwarding.
2. Research managed switch features and their impact on network security/performance.

---

## Routers
A **Router** connects multiple networks together (e.g., Local Network to Internet).

### Operation
Routers operate at **Layer 3 (Network Layer)** and use **IP addresses** to forward packets.
- **Routing Table**: Stores information about accessible networks and the best paths to them.
- **IP Address Analysis**: Determines the destination and next hop for each packet.
- **Forwarding**: Passes packets along the path until they reach the destination.

### Key Functions
- **Connect Networks**: Acts as a gateway between LANs and WANs/Internet.
- **NAT (Network Address Translation)**: Enables multiple devices on a private network to share one public IP.
- **Firewall**: Protects the network from unauthorized access.

### Types of Routers
- **Home Routers**: Combine router, switch, and Wi-Fi access point functions for simple setups.
- **Enterprise Routers**: Advanced devices with VPN, QoS, and high security for large organizations.

### Configuration
- **WAN Settings**: Internet connection details (IP, Gateway, DNS).
- **LAN Settings**: Local network management (IP range, DHCP).
- **Wireless & Security**: Wi-Fi setup (SSID, Password) and Firewall rules.

### Exercises
1. Diagram a network with computers connected to a router and the internet; trace packet flow.
2. Identify WAN and LAN settings in a home router interface.

---

## Comparison: Modem vs. Switch vs. Router

| Feature | Modem | Switch | Router |
| :--- | :--- | :--- | :--- |
| **Primary Function** | Signal translation (Digital ↔ Analog) | Connects devices within a LAN | Connects multiple networks |
| **OSI Layer** | Layer 1 & 2 (Physical/Data Link) | Layer 2 (Data Link) | Layer 3 (Network) |
| **Addressing** | N/A (Signal Modulation) | MAC Addresses | IP Addresses |
| **Traffic Flow** | Point-to-Point (ISP ↔ Home) | Specific Port (Unicast) | Best Path (Routing) |
| **Network Scope** | WAN Connection | Local Area Network (LAN) | LANs & WANs |