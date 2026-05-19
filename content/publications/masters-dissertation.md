---
title: "Accelerated Circuit Simulation: Harmonic Balance and Logic Partitioning"
date: 2019-05-01
authors: ["Shashank Obla"]
category: "other"
description: "Masters Dissertation, IIT Bombay, May 2019"
pdf: "uploads/publications/DDP_Final_Dissertation_OneSide.pdf"
---

This work focuses on the Harmonic Balance algorithm for Periodic Steady State simulations used in Microwave and RF circuit analysis dominated by non-linear devices such as MOSFETs. It contributes a fully automated harmonic balance simulator which is able to simulate a circuit supplied in a format similar to a SPICE netlist, with optimizations for parallelization of the sparse matrix solution, and analysis of causes of numerical instabilities. The thesis also proposes an acceleration of the algorithm on Intel's many-core architecture: Xeon Phi Knights Landing edition, and an analysis on feasibility of its implementation on an FPGA as an accelerator. Different techniques of logic partitioning of distributed logic simulation of large digital circuits have also been explored, including Sub-modular function optimization and eigenvalue-based spectral partitioning.
