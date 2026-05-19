---
title: "High Performance Multigrid V-Cycle using SIMD Intrinsics"
date: 2022-08-15
authors: ["Shashank Obla", "Eric Tang"]
category: "other"
# subtitle: "(Preprint)"
description: "18-645 Course Project, Dec 2022"
pdf: "uploads/ECE_645_Final_Report.pdf"
---

Partial Differential Equation (PDE) solvers form a large fraction of many scientific computation runtimes. An iterative solution to the Poisson equation, a common PDE, involves stencil computations which have poor memory reuse and hence are a challenge to accelerate. The multigrid method further increases complexity by requiring efficient kernels for various grid sizes and kernels to transform between the grid sizes. In this work, we analytically design kernels for the important kernels in the V-Cycle multigrid solver using the Jacobi smoothing function. Our kernels are designed to achieve peak throughput of the bottleneck instructions but are subject to inefficiencies due to memory bandwidth limits and the compiler. However, they still achieve at least 50% of the peak. We also design an appropriate intermediate grid layout and put our kernels together to implement the full V-Cycle flow. Compared to our chosen scalar baseline, which is already 40x faster than a PDE solver library, our implementation provides up to 10x speedup. We also discuss a parallelization scheme to achieve multi-threaded performance while minimizing the parallelization overhead.
