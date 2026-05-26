---
title: "High Performance Multigrid V-Cycle using SIMD Intrinsics"
date: 2022-08-15
authors: ["Shashank Obla", "Eric Tang"]
category: "other"
# subtitle: "(Preprint)"
description: "18-645 Course Project, Dec 2022"
pdf: "uploads/publications/ECE_645_Final_Report.pdf"
code: "https://github.com/shashankov/18-645_Project"
---

Partial Differential Equation (PDE) solvers form a large fraction of many scientific computation runtimes. An iterative solution to the Poisson equation, a common PDE, involves stencil computations that have poor memory reuse and are therefore a challenge to accelerate. The multigrid method further increases complexity by requiring efficient kernels for various grid sizes and kernels to transform between the grid sizes. In this work, we analytically design kernels for the key operations in the V-Cycle multigrid solver using the Jacobi smoothing function. Our kernels are designed to achieve peak throughput for the bottleneck instructions, but they are subject to inefficiencies due to memory bandwidth limits and compiler limitations. However, they still achieve at least 50% of the peak. We also design an appropriate intermediate grid layout and combine our kernels to implement the full V-Cycle flow. Compared to our chosen scalar baseline, which is already 40x faster than a PDE solver library, our implementation provides up to a 10x speedup. We also discuss a parallelization scheme to achieve multi-threaded performance while minimizing parallelization overhead.
