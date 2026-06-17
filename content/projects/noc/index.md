---
title: "ReCONNECT: FPGA-Optimized RTL-Native Network-on-Chip (NoC)"
description: "A highly parameterizable, high-performance Network-on-Chip (NoC) in SystemVerilog optimized for FPGAs, supporting multiple topologies and credit-based flow control."
date: 2025-01-01
tags:
  - Network-on-Chip
  - FPGA
  - CONNECT
code: "https://github.com/shashankov/ReCONNECT"
---

ReCONNECT is a highly parameterizable, high-performance soft Network-on-Chip (NoC) designed to be customizable to the needs of the application while remaining resource-minimal. Written directly in SystemVerilog (RTL), the NoC is specially optimized for high-frequency operations, exceeding **600 MHz** on modern FPGA architectures (such as Agilex 7). It also features native, out-of-the-box support for both Altera and AMD FPGAs, AXI-Stream wrappers, as well as fast behavioral simulation using Verilator (see the [Cross-Platform FPGA Support](#cross-platform-fpga-support) section below).

> **GitHub Repository:** [shashankov/ReCONNECT](https://github.com/shashankov/ReCONNECT)

---

## Real-World Applications & Validation

This open-source NoC has been rigorously validated and integrated into complex, state-of-the-art academic and industry research frameworks:
* **Streaming Group-by Aggregation Pipeline**: Used as the primary interconnect fabric for hash-based tuple partitioning on a single FPGA, achieving high throughput for input-dependent database analytics acceleration.
* **NoC-based OpenFPGA**: Adopted by other hardware design and research groups to power the interconnect topology of next-generation OpenFPGA architectures (see the paper: [OpenFPGA-NoC: Automated Fabric and Bitstream Generation for NoC-based FPGAs](https://doi.org/10.1145/3779449)).

---

## Key Architectural Features

* **Wormhole Routing & Credit-Based Flow Control**: Optimizes buffer space utilization while minimizing latency across the chip.
* **Deterministic Routing**: Features input-independent, output-based routing tables to ensure deterministic packet routing.
* **Virtual Links Support**: Guarantees that active packets are never interrupted, elimitation the need for reassembling logic
* **Full Crossbar Support**: Embedded inside the router to enable parallel, collision-free routing paths between non-conflicting inputs and outputs.
* **AXI-Stream Interface Wrapper**: Provides native wrappers to shim the credit-based NoC ports into a standard AXI-Stream interface.
* **Cross-Platform CDC & Width Conversion**: Fully supports mixed widths and asymmetric clock domains using Asynchronous FIFOs.

---

## Supported Topologies

The NoC design is modular, allowing users to instantiate the core router (`router.sv`) across a wide array of pre-configured network topologies:

1. **Mesh NoC (`mesh.sv`)**: Standard grid-based architecture using the unified router interface for IO pairs.
2. **Torus NoC (`torus.sv`)**: Standard torus grid with wrapped edges.
3. **Directional Torus NoC (`directional_torus.sv`)**: Optimized torus where links flow unidirectionally (West $\rightarrow$ East and North $\rightarrow$ South) wrapping around the boundaries.
4. **Ring & Double-Ring NoC (`ring.sv` & `double_ring.sv`)**: Multi-hop circular ring interconnects.
5. **Butterfly NoC (`butterfly.sv`)**: High-performance multi-stage routing network.
6. **Fully Connected NoC (`fully_connected.sv`)**: Point-to-point network where every router has a direct link to all other routers, supporting a configurable concentration factor.
7. **Fat Tree NoC (`fat_tree.sv`)**: A $k$-ary $n$-tree hierarchical topology optimizing switch utilization.

Using the templates for exisiting topologies, new custom topologies can be easily composed either manually or with the help of Agentic AI tools such as Antigravity or Claude.

---

## AXI-Stream Integration & Shims

To bridge the NoC's internal credit-based protocol and standard system buses, the repository provides AXI-Stream interface wrappers (`axis_mesh.sv`, `axis_torus.sv`, `axis_fully_connected.sv`, `axis_fat_tree.sv`, etc.) along with specialized serialization shims. These shims support **clock-crossing** and the associated **data-width conversion**, allowing the NoC to run at a higher frequency than the application logic.
* **`axis_serializer_shim_in`**: Deserializes high-speed incoming data streams into the credit-based internal NoC interface.
* **`axis_deserializer_shim_out`**: Adapts internal NoC credit-controlled output ports into compliant AXI-Stream signals.
* **Dual-Clock FIFO Wrapper (`dcfifo_wrapper.sv`)**: Integrates directly with vendor-specific RAM structures (or behavioral models) to implement low-latency clock crossing and word width translation.

---

## Cross-Platform FPGA Support

The Network-on-Chip (NoC) design is natively compatible with both Altera (Intel) and AMD (Xilinx) FPGAs. Platform target compilation is configured globally using preprocessor definitions:
* **`QUARTUS_FIFO`**: Maps buffers to Altera-specific hard macro blocks (`scfifo`, `dcfifo`, and `dcfifo_mixed_widths`) optimized for devices like Agilex 7.
* **`VIVADO_FIFO`**: Maps buffers to Xilinx Parameterized Macros (XPM), namely `xpm_fifo_sync` and `xpm_fifo_async`, allowing Vivado to automatically manage constraints and Clock Domain Crossing (CDC).
* **Behavioral (Default)**: If neither define is specified, the codebase falls back to behavioral simulation models. This facilitates rapid compilation and testing in tool-independent simulators (e.g. Verilator).

The codebase abstracts vendor-specific FIFOs under three unified wrappers located in `src/fifos/`:
* **`fifo_wrapper.sv`**: Single-clock input buffer wrapper.
* **`dcfifo_wrapper.sv`**: Clock Domain Crossing (CDC) wrapper.
* **`dcfifo_mixed_width_wrapper.sv`**: Asymmetric read/write CDC wrapper for SerDes shims.

## Simulation & Verification

The project includes a simulation and verification suite configured via the `test/Makefile` runner.

### Simulator Support
1. **Verilator (Default)**: Supports fast, lightweight behavioral compilation and run-time testing (requires Verilator 5.0+).
   ```bash
   cd test
   make run
   ```
2. **ModelSim**: Supports behavioral simulation as well as physical Quartus/Vivado FIFO models.
   ```bash
   make modelsim [OPTIONS...]
   ```

### Regression Testing
A regression testing suite validates topologies and a few serialization/clock-crossing configurations.
```bash
# Run regression with behavioral simulation in Verilator
make regress

# Run regression using ModelSim with Vivado/AMD FIFOs
make regress_vivado

# Run regression using ModelSim with Quartus/Intel FIFOs
make regress_quartus
```

### Automated Load-Latency Sweep & Analysis
To analyze NoC saturation points and latency characteristics under different throughput workloads:
* **`test/generate_load_latency.py`**: Sample-efficient script that explores the offered-load space, dynamically refining measurements near the saturation point. It outputs results to a CSV file.
* **`test/plot_latency.py`**: Reads the CSV output and plots a latency-vs-load curve using `matplotlib`.

```bash
# Run a sweep on a 4x4 Mesh topology
./generate_load_latency.py --topology mesh --num-rows 4 --num-cols 4 --output mesh_4x4.csv

# Plot the generated load-latency curve
./plot_latency.py --csv mesh_4x4.csv --output mesh_curve.png
```
