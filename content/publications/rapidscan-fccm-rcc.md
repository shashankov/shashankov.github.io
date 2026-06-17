---
title: "RapidScan: High-Throughput Parameterized HLS-based Streaming String Matching Library for FPGAs"
date: 2026-05-18
authors: ["Shashank Obla", "Tommy Tracy II", "Matthew Beck", "James C. Hoe", "Kevin Skadron", "Wajih Ul Hassan"]
description: "Reconfigurable Computing Challenge, FCCM 2026 — We won 3rd place 🥉!"
pdf: "uploads/publications/FCCM_RCC_2026.pdf"
poster: "uploads/publications/RCC_FCCM_Poster.pdf"
slides: "uploads/publications/RapidScan_FCCM_RCC_Lightning_animation_split.pdf"
code: "https://github.com/pigasus-hls/RapidDetect-RCC"
doi: "10.1109/FCCM68464.2026.00079"
selected: true
---

Prior work in hardware acceleration of regular-expression matching deep packet inspection has shown orders of magnitude improvement in energy and cost. However, efficiency gains from an RTL implementation lack portability across domains, FPGA platforms and even rulesets or input traffic patterns that demand re-tuning of the streaming input-dependent filtering stages. In this work, we introduce RapidScan, a novel HLS-based streaming string-matching library that treats parameterizability and development agility as first-class FPGA design goals alongside performance and efficiency. Using the streaming computation model, we designed the data-dependent computations of string matching into a library of fully-pipelined HLS kernels. The kernels can be composed into a streaming pipeline at compile time as well as parameterized to trade off performance and resources for specific workloads. To demonstrate the library's efficacy, we showcase its application to log monitoring on the Versal V80 device. The resulting system, RapidDetect, achieves a throughput of over 160 Gbps on real-world log inputs using a single server.
