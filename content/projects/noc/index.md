---
title: "FPGA-Optimized Network-on-Chip (NoC)"
description: "A highly parameterizable, high-performance Network-on-Chip (NoC) in SystemVerilog optimized for FPGAs, supporting multiple topologies and credit-based flow control."
date: 2025-01-01
tags:
  - Network-on-Chip
  - FPGA
code: "https://github.com/shashankov/noc"
---

The **FPGA-Optimized Network-on-Chip (NoC)** is a highly parameterizable, high-performance soft network-on-chip designed to be customizable to the needs of the application while being resource-minimal. Written directly in SystemVerilog (RTL), the NoC is specially optimized for high-frequency operations on Intel FPGA architectures (such as Intel Agilex 7) and operates at frequencies exceeding **500 MHz**. While the repository does not provide FIFO IPs for AMD FPGAs, it is designed such that they can be easily replaced with equivalent IPs (see the [Porting to AMD FPGAs](#porting-to-amd-fpgas) section below).

> **GitHub Repository:** [shashankov/noc](https://github.com/shashankov/noc)

---

## Real-World Applications & Validation

This open-source NoC has been rigorously validated and integrated into complex, state-of-the-art academic and industry research frameworks:
* **64 GBps Streaming Group-by Aggregation Pipeline**: Used as the primary interconnect fabric for hash-based tuple partitioning on a single FPGA, achieving high throughput for input-dependent database analytics acceleration.
* **NoC-based OpenFPGA**: Adopted by other hardware design and research groups to power the interconnect topology of next-generation OpenFPGA architectures (see the paper: [OpenFPGA-NoC: Automated Fabric and Bitstream Generation for NoC-based FPGAs](https://doi.org/10.1145/3779449)).

---

## Key Architectural Features

* **Wormhole Routing & Credit-Based Flow Control**: Optimizes buffer space utilization while minimizing latency across the chip.
* **Deterministic Routing**: Features input-independent, output-based routing tables to ensure deterministic packet routing.
* **Virtual Links Support**: Guarantees that active packets are never interrupted, preventing deadlocks and maintaining link integrity.
* **Full Crossbar Support**: Embedded inside the router to enable parallel, collision-free routing paths between non-conflicting inputs and outputs.
* **AXI-Stream Interface Wrapper**: Provides native wrappers to transition the credit-based NoC ports into a standard AXI-Stream interface.
* **Clock Domain Crossing & Width Conversion**: Fully supports mixed widths and asymmetric clock domains using highly optimized Agilex 7 Asynchronous FIFOs.

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

To bridge the NoC's internal credit-based protocol and standard system buses, the repository provides AXI-Stream interface wrappers (`axis_mesh.sv`, `axis_torus.sv`, etc.) along with specialized serialization shims. These shims support **clock-crossing** and the associated **data-width conversion**, allowing the NoC to run at a higher frequency than the application logic.
* **`axis_serializer_shim_in`**: Deserializes high-speed incoming data streams into the credit-based internal NoC interface.
* **`axis_deserializer_shim_out`**: Adapts internal NoC credit-controlled output ports into compliant AXI-Stream signals.
* **Intel Agilex Dual-Clock FIFOs (`dcfifo_agilex7.sv`)**: Integrates directly with Agilex-specific RAM structures to implement low-latency clock crossing and word width translation.

---

## Porting to AMD FPGAs

The Network-on-Chip (NoC) design is optimized out-of-the-box for Intel Agilex 7 devices using Intel-specific IP macros (`scfifo`, `dcfifo`, and `dcfifo_mixed_widths`) to achieve high performance. To run this NoC on AMD (Xilinx) FPGAs using Vivado, you must replace these Intel-specific blocks with AMD-compatible equivalents.

### Recommended Approach: Xilinx Parameterized Macros (XPM)
Instead of generating fixed IP blocks via the Vivado IP Catalog, we recommend using **Xilinx Parameterized Macros (XPMs)**. These macros are instantiated directly in RTL, enabling compile-time parameterization that mirrors Intel's parameterizable logic.
* **`xpm_fifo_sync`**: Replaces the single-clock `scfifo` block used in virtual channel buffers inside the router.
* **`xpm_fifo_async`**: Replaces the dual-clock same-width/mixed-width FIFO blocks used in the clock-domain crossing shims.
* **Auto-managed Constraints**: Using XPM FIFOs allows Vivado to automatically handle Clock Domain Crossing (CDC) and synchronization constraints natively. The Intel-specific `.sdc` files can be ignored or deleted.

<!-- ### Required File Changes
To complete the porting process, the following files in the [rtl/](file:///home/sobla/workspace/noc/rtl) directory must be modified or replaced:

| File Type | Intel-Specific File | Action / AMD Implementation |
| :--- | :--- | :--- |
| **Wrapper** | [fifo_agilex7.sv](file:///home/sobla/workspace/noc/rtl/fifo_agilex7.sv) | Replace implementation with `xpm_fifo_sync`. Maintain identical port mapping. |
| **Wrapper** | [dcfifo_agilex7.sv](file:///home/sobla/workspace/noc/rtl/dcfifo_agilex7.sv) | Replace implementation with `xpm_fifo_async`. Map `wrusedw` using `wr_data_count`. |
| **Wrapper** | [dcfifo_mixed_width_agilex7.sv](file:///home/sobla/workspace/noc/rtl/dcfifo_mixed_width_agilex7.sv) | Replace implementation with `xpm_fifo_async` configured with different read/write widths. |
| **RTL Instantiation** | [router.sv](file:///home/sobla/workspace/noc/rtl/router.sv) | Update `fifo_agilex7` instantiations to target the AMD FIFO wrapper. |
| **RTL Instantiation** | [axis_serdes_shims.sv](file:///home/sobla/workspace/noc/rtl/axis_serdes_shims.sv) | Update `dcfifo_agilex7`, `dcfifo_mixed_width_agilex7`, and `fifo_agilex7` instantiations. |
| **Testbench** | [test_harness/axis_tg_sim.sv](file:///home/sobla/workspace/noc/rtl/test_harness/axis_tg_sim.sv) | Update `fifo_agilex7` instantiation in the simulation traffic generator. |
| **Constraints** | [dcfifo_agilex7.sdc](file:///home/sobla/workspace/noc/rtl/dcfifo_agilex7.sdc)<br>[dcfifo_mixed_width_agilex7.sdc](file:///home/sobla/workspace/noc/rtl/dcfifo_mixed_width_agilex7.sdc) | Ignore or delete. Vivado handles CDC constraints internally for XPM FIFOs. |

---

### Reference Implementations

#### 1. Single-Clock FIFO (`fifo_amd.sv`)
Wrap `xpm_fifo_sync` to match the NoC's single-clock FIFO interface:

```systemverilog
module fifo_amd #(
    parameter DEPTH = 4,
    parameter WIDTH = 32,
    parameter SHOWAHEAD = "OFF"
) (
    input  wire                 clock,
    input  wire [WIDTH-1:0]     data,
    input  wire                 rdreq,
    input  wire                 sclr,
    input  wire                 wrreq,
    output wire                 empty,
    output wire                 full,
    output wire [WIDTH-1:0]     q,
    output wire [$clog2(DEPTH)-1:0] usedw
);
    xpm_fifo_sync #(
        .FIFO_MEMORY_TYPE    ("auto"),
        .FIFO_WRITE_DEPTH    (DEPTH),
        .WRITE_DATA_WIDTH    (WIDTH),
        .READ_DATA_WIDTH     (WIDTH),
        .READ_MODE           (SHOWAHEAD == "ON" ? "fwft" : "std"),
        .FIFO_READ_LATENCY   (SHOWAHEAD == "ON" ? 0 : 1),
        .USE_ADV_FEATURES    (16'h0400), // Enable wr_data_count
        .WR_DATA_COUNT_WIDTH ($clog2(DEPTH))
    ) xpm_fifo_sync_inst (
        .rst                 (sclr),
        .wr_clk              (clock),
        .wr_en               (wrreq),
        .din                 (data),
        .rd_en               (rdreq),
        .dout                (q),
        .empty               (empty),
        .full                (full),
        .wr_data_count       (usedw),
        .dbterr              (),
        .sbiterr             (),
        .rd_rst_busy         (),
        .wr_rst_busy         ()
    );
endmodule
```

#### 2. Dual-Clock FIFO (`dcfifo_amd.sv`)
Wrap `xpm_fifo_async` to match the NoC's clock-domain crossing FIFO:

```systemverilog
module dcfifo_amd #(
    parameter WIDTH = 512,
    parameter DEPTH = 8,
    parameter EXTRA_SYNC_STAGES = 0,
    parameter SHOWAHEAD = "OFF"
) (
    input  wire                 aclr,
    input  wire [WIDTH-1:0]     data,
    input  wire                 rdclk,
    input  wire                 rdreq,
    input  wire                 wrclk,
    input  wire                 wrreq,
    output wire [WIDTH-1:0]     q,
    output wire                 rdempty,
    output wire                 wrfull,
    output wire [$clog2(DEPTH):0] wrusedw
);
    xpm_fifo_async #(
        .FIFO_MEMORY_TYPE    ("auto"),
        .FIFO_WRITE_DEPTH    (DEPTH),
        .WRITE_DATA_WIDTH    (WIDTH),
        .READ_DATA_WIDTH     (WIDTH),
        .READ_MODE           (SHOWAHEAD == "ON" ? "fwft" : "std"),
        .FIFO_READ_LATENCY   (SHOWAHEAD == "ON" ? 0 : 1),
        .CDC_SYNC_STAGES     (2 + EXTRA_SYNC_STAGES),
        .USE_ADV_FEATURES    (16'h0400), // Enable wr_data_count
        .WR_DATA_COUNT_WIDTH ($clog2(DEPTH) + 1)
    ) xpm_fifo_async_inst (
        .rst                 (aclr),
        .wr_clk              (wrclk),
        .wr_en               (wrreq),
        .din                 (data),
        .rd_clk              (rdclk),
        .rd_en               (rdreq),
        .dout                (q),
        .empty               (rdempty),
        .full                (wrfull),
        .wr_data_count       (wrusedw),
        .dbterr              (),
        .sbiterr             (),
        .rd_rst_busy         (),
        .wr_rst_busy         ()
    );
endmodule
```

#### 3. Mixed-Width Dual-Clock FIFO (`dcfifo_mixed_width_amd.sv`)
Configure `xpm_fifo_async` with asymmetrical write/read widths for serialization/deserialization:

```systemverilog
module dcfifo_mixed_width_amd #(
    parameter WIDTH_IN = 512,
    parameter WIDTH_OUT = 128,
    parameter DEPTH = 8,
    parameter EXTRA_SYNC_STAGES = 0,
    parameter SHOWAHEAD = "OFF"
) (
    input  wire                 aclr,
    input  wire [WIDTH_IN-1:0]  data,
    input  wire                 rdclk,
    input  wire                 rdreq,
    input  wire                 wrclk,
    input  wire                 wrreq,
    output wire [WIDTH_OUT-1:0] q,
    output wire                 rdempty,
    output wire                 wrfull,
    output wire [$clog2(DEPTH):0] wrusedw
);
    xpm_fifo_async #(
        .FIFO_MEMORY_TYPE    ("auto"),
        .FIFO_WRITE_DEPTH    (DEPTH),
        .WRITE_DATA_WIDTH    (WIDTH_IN),
        .READ_DATA_WIDTH     (WIDTH_OUT),
        .READ_MODE           (SHOWAHEAD == "ON" ? "fwft" : "std"),
        .FIFO_READ_LATENCY   (SHOWAHEAD == "ON" ? 0 : 1),
        .CDC_SYNC_STAGES     (2 + EXTRA_SYNC_STAGES),
        .USE_ADV_FEATURES    (16'h0400), // Enable wr_data_count
        .WR_DATA_COUNT_WIDTH ($clog2(DEPTH) + 1)
    ) xpm_fifo_async_mixed_inst (
        .rst                 (aclr),
        .wr_clk              (wrclk),
        .wr_en               (wrreq),
        .din                 (data),
        .rd_clk              (rdclk),
        .rd_en               (rdreq),
        .dout                (q),
        .empty               (rdempty),
        .full                (wrfull),
        .wr_data_count       (wrusedw),
        .dbterr              (),
        .sbiterr             (),
        .rd_rst_busy         (),
        .wr_rst_busy         ()
    );
endmodule
``` -->

<!-- ---

## Simulation & Verification

The project includes an extensive suite for simulation and verification:
* **`test_harness/`**: Includes a complete packet/traffic generator and checker to test the NoC under various throughput workloads using the AXI-Stream wrapper.
* **`testbench/`**: Comprehensive SystemVerilog testbenches verifying individual router nodes, FIFOs, and overall network health.
* **`sim/`**: Automated simulation scripting (ModelSim / QuestaSim TCL scripts) supporting fast local builds and RTL wave debugging. -->
