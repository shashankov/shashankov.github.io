---
title: "Versal V80 Fan Shroud"
description: "A custom 3D-printable active cooling shroud for the AMD Versal V80 accelerator card, designed to mount a high-static-pressure 80mm fan."
date: 2026-05-19
tags:
  - 3D Printing
  - Hardware Cooling
  - AMD Versal
  - V80
  - FPGA
stl: "uploads/projects/v80_shroud/v80_side_golden_usb_fixed.STL"
---

Active cooling is essential on production-ready platforms like the AMD Versal V80 which can consume close to 200W of power under full load. Although it is recommended to only run the V80 in a server system with appropriate cooling, academics like me might not always have quick access to such systems. This project provides a custom 3D-printable active cooling fan shroud designed to attach an 80mm fan directly to the V80 board, ensuring optimal airflow across the board's heatsink.

{{< alert type="success" >}}
Under the `xbtest` pre-canned stress test (upto 250W peak power draw), the card did not exceed 85°C with this setup! As an aside, the V80 installed in a server is not even guranteed to be cooled better than this setup!
{{< /alert >}}

![Installed Shroud on V80](../../uploads/projects/v80_shroud/installed.png)
*The active cooling fan shroud installed on the AMD Xilinx Versal V80.*

---

## 3D Model & Design

The shroud's geometry fits precisely around the V80's physical profile, directing airflow directly through the passive fins. Appropriate spacing is built in to allow for PCIe power and USB connections. 

![3D Model Render](../../uploads/projects/v80_shroud/3d_model.png)
*3D render of the fan shroud.*

* **Download 3D Model:** [v80_side_golden_usb_fixed.STL](../../uploads/projects/v80_shroud/v80_side_golden_usb_fixed.STL) (also available on [Thingiverse](https://www.thingiverse.com/thing:7355999))

---

## 3D Printing Recommendations

When preparing the model in your slicer, keep the following tips in mind:
* **Orientation:** Place the **fan-side down** on the build plate for the best print results and to minimize necessary supports.
* **Warning:** A part of the shroud is extremely thin (one of the screw holes as they pass through the loft surface) and might produce a hole. This hole is very small and can be easily patch with some duct tape or glue. 

---

## Assembly & Mounting

* **Fan Selection:** The design is tailored for 80mm fans. We recommend a fan with **high static pressure at full speed** to push air effectively through the dense heatsink. 
  * The recommended fan is the **[ARCTIC P8 Max (80 mm High Speed PWM Fan)](https://share.google/7ZDRTdEoxSe6mZnU6)**, but any standard 80mm fan should fit.
* **Securing the Shroud:** 
  * You can secure the shroud to the V80 by borrowing a couple of screws from the underside of the board.
  * Alternatively, duct tape works perfectly fine for a quick, non-permanent mount.
