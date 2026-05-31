# Cybersecurity & IT Fundamentals Notes

---

## 4.1 Cybersecurity Devices and Technologies

### Security Appliances (6 Categories)
| Category | Description |
|----------|-------------|
| **Routers** | Direct network traffic |
| **Firewalls** | Control allowed communications |
| **IPS** | Intrusion Prevention System |
| **VPN** | Virtual Private Network |
| **Antivirus/Antimalware** | Detect and remove threats |
| **Other** | Web/email security tools |

---

## Firewalls

> **Key Point:** Control which communications are allowed in/out. Can be software on one computer or a standalone network device.

### Types of Firewalls
| Type | What It Filters |
|------|-----------------|
| **Network Layer** | Source/destination IP |
| **Transport Layer** | Ports, connection states |
| **Application Layer** | Apps, programs, services |
| **Context Aware** | User, device, role, threat profile |
| **Proxy Server** | Web content (URLs, domains, media) |
| **Reverse Proxy** | Hides/distributes web server access |
| **NAT Firewall** | Hides private network addresses |
| **Host-based** | Ports/services on single OS |

---

## Port Scanning
- Each app uses an **assigned port number**
- **Purpose:** Probe computers for open ports
- **Tools:** `nmap`, `zenmap`

---

## IDS vs IPS

| Feature | **IDS** (Detection) | **IPS** (Prevention) |
|---------|---------------------|----------------------|
| Action | Alert, detect, log, report | **Block/deny traffic** |
| Response | Passive - no prevention | Active - takes action |

> **Key Difference:** IDS only alerts; IPS actually blocks attacks.

---

## Security Best Practices (NIST Guidelines)

1. Perform **risk assessment**
2. Create a **security policy**
3. Physical security measures
4. Human resources security
5. **Perform and test backups**
6. Maintain **patches and updates**
7. Employ **access controls**
8. Test **incident response**
9. Network monitoring/analytics tools
10. Network security devices
11. **Endpoint security** solutions
12. **Educate users**
13. **Encrypt data**

---

## Behavior-Based Security

> **Definition:** Threat detection by analyzing communication flow. Changes from normal patterns = **anomalies**

### Key Tools
- **Honeypots** - Lure attackers, analyze behavior, build better defenses
- **NetFlow** - Track who/what/when/how users access network

---

## Penetration Testing (5 Steps)

| Step | Description |
|------|-------------|
| 1. **Planning** | Gather information |
| 2. **Scanning** | Active reconnaissance |
| 3. **Gaining Access** | Exploit launch, social engineering, vulnerability exploitation |
| 4. **Maintaining Access** | Trojans, rootkits, covert channels |
| 5. **Analysis & Reporting** | Recommendations for improvements |

---

## Impact Reduction (When Breached)

1. **Communicate** the issue
2. Be **sincere and accountable**
3. Provide **details**
4. Find the **cause**
5. Apply **lessons learned**
6. Check and check again
7. **Educate!**

---

## Risk Management (4 Steps)

> **Goal:** Reduce impact of threats - you can't eliminate risk completely

| Step | Action |
|------|--------|
| 1. **Frame** | Identify threats (processes, products, attacks, service disruptions) |
| 2. **Assess** | Quantitative & qualitative analysis |
| 3. **Respond** | Eliminate, mitigate, transfer, or accept |
| 4. **Monitor** | Track accepted risks closely |

---

## Cisco Security Tools
- **SIEM** - Security Information and Event Management
- **DLP** - Data Loss Prevention System
- **ISE** - Identity Services Engine

---
---

# Computer Hardware Fundamentals

## Quick Reference: Core Components

| Component | Role | Key Metric |
|-----------|------|------------|
| **CPU** | Brain - executes instructions | Cores, Clock Speed (GHz) |
| **RAM** | Short-term memory | Capacity (GB), Speed (MHz) |
| **Motherboard** | Central nervous system | Socket type, PCIe slots |
| **Storage** | Long-term memory | Capacity, Read/Write speed |
| **GPU** | Visual processing | VRAM, Cores |
| **PSU** | Power conversion | Wattage, Efficiency rating |
| **Case** | Protection & cooling | Form factor, Airflow |

---

## CPU (Central Processing Unit)

> **The Brain** - Executes instructions, performs calculations, manages data flow

### Key Parts
| Part | Function |
|------|----------|
| **ALU** | Arithmetic (add, subtract) + Logic (AND, OR, NOT) |
| **Control Unit** | Coordinates operations, manages data flow |
| **Registers** | Temporary high-speed data storage |

### Key Metrics
| Metric | What It Means |
|--------|---------------|
| **Cores** | Independent processing units (more = better multitasking) |
| **Threads** | Instruction streams handled simultaneously |
| **Clock Speed** | Cycles per second (GHz) - higher = faster |
| **Cache (L1/L2/L3)** | Fast on-chip memory for frequent data |

> **Analogy:** CPU = Head chef in kitchen. Cores = individual cooks. Threads = chef's ability to multitask. Cache = nearby pantry with common ingredients.

---

## RAM (Random Access Memory)

> **Short-term Memory** - Fast, volatile storage for active data

### Key Points
- **Volatile** = Data lost when power off
- Faster than storage drives
- More RAM = more apps running smoothly

### Key Metrics
| Metric | Details |
|--------|---------|
| **Capacity** | 8GB (basic), 16GB (standard), 32GB+ (professional) |
| **Speed** | MHz or MT/s - higher = faster access |
| **Type** | DDR4 (common), DDR5 (newer, faster) |

> **Analogy:** RAM = Workbench. Bigger workbench = more projects at once. Faster RAM = quicker access to tools.

---

## Motherboard

> **Central Nervous System** - Connects all components together

### Key Components
| Component | Purpose |
|-----------|---------|
| **CPU Socket** | Where CPU installs (LGA 1700/Intel, AM5/AMD) |
| **RAM Slots (DIMM)** | Memory module slots (usually 2-4) |
| **Chipset** | Manages data flow between components |
| **PCIe Slots** | High-speed expansion (GPU, NVMe) |
| **SATA Ports** | Connect HDDs and SATA SSDs |
| **M.2 Slots** | High-speed NVMe SSDs |
| **BIOS/UEFI** | Firmware that initializes hardware on boot |

> **Analogy:** Motherboard = Railway junction. CPU socket = main station. PCIe = express lines. Chipset = signal operator.

---

## Storage Devices

### HDD vs SSD Comparison

| Feature | **HDD** | **SSD** | **NVMe SSD** |
|---------|---------|---------|--------------|
| Technology | Spinning platters | Flash memory | Flash (PCIe) |
| Speed | Slower | Fast | **Fastest** |
| Cost per GB | Cheapest | Medium | Higher |
| Durability | Fragile (moving parts) | **Durable** | **Durable** |
| Best For | Bulk storage, backups | OS, apps | Performance-critical |

### Speed Comparison
- **HDD:** ~150 MB/s
- **SATA SSD:** ~550 MB/s
- **NVMe SSD:** **3,000-7,000+ MB/s**

> **Analogy:** HDD = Physical library (walking to find books). SSD = Digital database (instant search). NVMe = Lightning-fast optimized database.

---

## GPU (Graphics Processing Unit)

> **Visual Powerhouse** - Specialized for parallel processing and rendering

### Integrated vs Dedicated

| Type | Description | Best For |
|------|-------------|----------|
| **Integrated** | Built into CPU, shares RAM | Basic tasks, browsing |
| **Dedicated** | Separate card with own VRAM | Gaming, video editing, AI |

### Key Metrics
| Metric | Purpose |
|--------|---------|
| **VRAM** | Dedicated video memory for textures/frames |
| **Cores/Stream Processors** | Parallel processing units |
| **Clock Speed** | Processing speed |

> **Manufacturers:** NVIDIA (GeForce), AMD (Radeon), Intel (Arc)

> **Analogy:** Integrated GPU = Single artist. Dedicated GPU = Team of hundreds of specialized artists working in parallel.

---

## PSU (Power Supply Unit)

> **Energy Source** - Converts AC wall power to DC for components

### Key Metrics
| Metric | What to Know |
|--------|--------------|
| **Wattage** | Total power capacity (650W-1000W+ for gaming) |
| **Efficiency (80 PLUS)** | Bronze < Silver < Gold < Platinum < Titanium |
| **Modularity** | Non-modular / Semi / **Fully modular** (best) |

> **Rule:** Always get PSU with headroom above your system's needs.

---

## Case (Chassis)

> **Protective Shell** - Houses components, manages airflow

### Key Considerations
| Factor | Details |
|--------|---------|
| **Form Factor** | Full-Tower > Mid-Tower > Mini-Tower |
| **Motherboard Support** | ATX, Micro-ATX, Mini-ITX |
| **Airflow** | Front intake, rear/top exhaust |
| **Cable Management** | Better cables = better airflow |

---

## Quick Build Guide: Use Case Examples

### Casual User (Budget)
| Component | Recommendation |
|-----------|----------------|
| CPU | Mid-range (Intel i5 / AMD Ryzen 5) |
| RAM | 8-16GB DDR4 |
| Storage | 500GB-1TB SSD |

### Professional Video Editor
| Component | Recommendation |
|-----------|----------------|
| CPU | High-end multi-core (i9 / Ryzen 9) |
| RAM | **32-64GB DDR5** |
| Storage | Fast NVMe SSD (1TB+) + HDD for archives |
| GPU | Dedicated with high VRAM |

---

## Troubleshooting: Common Bottlenecks

| Symptom | Likely Bottleneck | Solution |
|---------|-------------------|----------|
| Slow boot, app loading | **Storage (HDD)** | Upgrade to SSD |
| Low FPS in games | **GPU** | Upgrade graphics card |
| Sluggish multitasking | **RAM** | Add more memory |
| Overheating, throttling | **Cooling** | Improve airflow/fans |

---

## Key Acronyms Reference

| Acronym | Full Name |
|---------|-----------|
| CPU | Central Processing Unit |
| GPU | Graphics Processing Unit |
| RAM | Random Access Memory |
| ROM | Read-Only Memory |
| HDD | Hard Disk Drive |
| SSD | Solid State Drive |
| NVMe | Non-Volatile Memory Express |
| PCIe | Peripheral Component Interconnect Express |
| SATA | Serial Advanced Technology Attachment |
| PSU | Power Supply Unit |
| BIOS | Basic Input/Output System |
| UEFI | Unified Extensible Firmware Interface |
| VRAM | Video Random Access Memory |
| ALU | Arithmetic Logic Unit |

---

## 

---




> **Resources:** [NIST Computer Security Resource Center](https://csrc.nist.gov/)
