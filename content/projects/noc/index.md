---
title: "FPGA-Optimized Network-on-Chip (NoC)"
description: "A highly-parametrizable, high-performance Network-on-Chip (NoC) in SystemVerilog optimized for FPGAs, supporting multiple topologies and credit-based flow control."
date: 2025-01-01
tags:
  - Network-on-Chip
  - FPGA
code: "https://github.com/shashankov/noc"
---

The **FPGA-Optimized Network-on-Chip (NoC)** is a highly-parametrizable, high-performance soft network-on-chip designed to be customizable to the needs of the application while being resource-minimal. Written directly in SystemVerilog (RTL), the NoC is specially optimized for high-frequency operations on Intel FPGA architectures (such as Intel Agilex 7) and operates at frequencies exceeding **500 MHz**. While the repository does not provide FIFO IPs for AMD FPGAs, it is designed such that they can be easily replaced with equivalent IPs (look for the separate fifo*.sv files).

> **GitHub Repository:** [shashankov/noc](https://github.com/shashankov/noc)

---

## Real-World Applications & Validation

This open-sourced NoC has been rigorously validated and integrated into complex, state-of-the-art academic and industry research frameworks:
* **64 GBps Streaming Group-by Aggregation Pipeline**: Used as the primary interconnect fabric for hash-based tuple partitioning on a single FPGA, achieving high-throughput for input-dependent database analytics acceleration.
* **NoC-based OpenFPGA**: Adopted by other hardware design and research groups to power the interconnect topology of next-generation OpenFPGA architectures (see the paper: [OpenFPGA-NoC: Automated Fabric and Bitstream Generation for NoC-based FPGAs](https://doi.org/10.1145/3779449)).

---

## Key Architectural Features

* **Wormhole Routing & Credit-Based Flow Control**: Optimizes buffer space utilization while minimizing latency across the chip.
* **Deterministic Routing**: Features input-independent, output-based routing tables to ensure deterministic packet routing.
* **Virtual Links Support**: Guarantees that active packets are never interrupted, preventing deadlocks and maintaining link integrity.
* **Full Crossbar Support**: Embedded inside the router to enable parallel, collision-free routing paths between non-conflicting inputs and outputs.
* **AXI-Stream Interface Wrapper**: Provides native wrappers to transition the credit-based NoC ports into a standard AXI-Stream interface.
* **Clock Domain Crossing & Width Conversion**: Fully supports mixed widths and asymmetric clock domains using highly-optimized Agilex 7 Asynchronous FIFOs.

---

## Supported Topologies

The NoC design is modular, allowing users to instantiate the core router (`router.sv`) across a wide array of pre-configured network topologies:

1. **Mesh NoC (`mesh.sv`)**: Standard grid-based architecture using the unified router interface for IO pairs.
2. **Torus NoC (`torus.sv`)**: Standard torus grid with wrapped edges.
3. **Directional Torus NoC (`directional_torus.sv`)**: Optimized torus where links flow unidirectionally (West $\rightarrow$ East and North $\rightarrow$ South) wrapping around the boundaries.
4. **Ring & Double-Ring NoC (`ring.sv` & `double_ring.sv`)**: Multi-hop circular ring interconnects.
5. **Butterfly NoC (`butterfly.sv`)**: High-performance multi-stage routing network.

---

## Routing Table Generation

To support arbitrary network structures and load balancing, the project features custom Python-based generators (`routing_tables/`) to compute static routing tables:
* **Mesh & Torus Topologies**: Uses **Dimension-Ordered X-Y Routing**.
* **Ring & Double-Ring Topologies**: Computes routing tables based on the shortest-path algorithm.
* **Torus Load Balancing**: Resolves equidistant routing ties by alternating paths chosen for each node, which distributes traffic loads evenly across all active links.

### Routing Table Generators:
```bash
# General router table generation
./gen_router_table.py <num_inputs> <num_outputs> <file_prefix>

# Topology-specific table generation
./gen_mesh_table.py <num_rows> <num_cols> <file_prefix>
./gen_dtorus_table.py <num_rows> <num_cols> <file_prefix>
./gen_torus_table.py <num_rows> <num_cols> <file_prefix>
./gen_ring_table.py <num_routers> <file_prefix>
./gen_double_ring_table.py <num_routers> <file_prefix>
```

---

## AXI-Stream Integration & Shims

To bridge the NoC's internal credit-based protocol and standard system buses, the repository provides AXI-Stream interface wrappers (`axis_mesh.sv`, `axis_torus.sv`, etc.) along with specialized serialization shims:
* **`axis_serializer_shim_in`**: Deserializes high-speed incoming data streams into the credit-based internal NoC interface.
* **`axis_deserializer_shim_out`**: Adapts internal NoC credit-controlled output ports into compliant AXI-Stream signals.
* **Intel Agilex-Optimized FIFOs (`dcfifo_agilex7.sv`, `fifo_agilex7.sv`)**: Integrates directly with Agilex-specific RAM structures to implement low-latency clock crossing and word width mismatch alignment.

<!-- ---

## Simulation & Verification

The project includes an extensive suite for simulation and verification:
* **`test_harness/`**: Includes a complete packet/traffic generator and checker to test the NoC under various throughput workloads using the AXI-Stream wrapper.
* **`testbench/`**: Comprehensive SystemVerilog testbenches verifying individual router nodes, FIFOs, and overall network health.
* **`sim/`**: Automated simulation scripting (ModelSim / QuestaSim TCL scripts) supporting fast local builds and RTL wave debugging. -->
