---
title: "Enabling Hardware Design Tradeoffs at Runtime with Dynamically Composable Designs for FPGAs"
date: 2021-04-01
authors: ["Shashank Obla"]
category: "other"
# subtitle: "(Preprint)"
description: "ECE Qualifiers, Apr 2021"
pdf: "uploads/qual_paper_sobla.pdf"
---

The traditional static ASIC-style approach to FPGA design is incompatible with FPGA deployment and the dynamic software paradigm in servers. While balancing current FPGA limitations with anticipated Partial Reconfiguration (PR) support, this work proposes a framework that (a) promotes a service-oriented design style, enabling designs to be composed of reusable modules for faster development and (b) supports dynamic composability of modules and their variants using PR enabling runtime tradeoff resolution. A proof-of-concept using a service-oriented implementation of BFS targeting (a) caching and (b) graph representations, shows that such a framework can, without compromising performance, achieve lower resource utilization as a function of inputs and FPGA load at runtime.
