---
title: "Transcribing Chess Board"
description: "An electronic chessboard that transcribes physical piece locations and transmits them to a PC, built for the Intro to Modern Making course at CMU."
date: 2024-02-23
tags:
  - Arduino
  - Laser Cutting
  - Hardware
  - Physical Computing
  - Embedded Systems
---

We designed and built a **transcribing chessboard** that electronically detects the locations of chess pieces and transmits the coordinates to a computer for processing. Our goal was to implement a low-cost system using only basic electronics without the need for expensive cameras or image processing to read the state of the chessboard. Built as part of **24-104: Intro to Modern Making**, the initial project scope included both piece detection and an under-square LED array to highlight legal moves, opponent moves, or suggestions from a chess engine. However, due to time constraints, we focused our efforts on the core transcription system.

![Transcribing Chess Board](../../uploads/projects/modern_making_chessboard/demo.jpg)
*The final assembled transcribing chess board.*

---

## Technical Overview & Grid Detection

The system utilizes a matrix interface where each square acts as a switch triggered by a physical chess piece. The detection mechanism relies on an Arduino microcontroller scanning a matrix grid.

The detection code on the Arduino works by setting a drive pin (representing a column) to `LOW` and reading off the sense pins (representing rows). It then compares the current reading with the previous state and transmits any changes to a connected PC via Serial. A companion Python program on the PC receives and processes these coordinate changes in real-time, displaying the game as it is played in real life.

### Arduino Detection Code
Below is the core scanning logic implemented in the Arduino firmware:

```cpp
void senseGrid() {
  for (int i = 0; i < N; i++) {
    pinMode(X_PINS[i], OUTPUT);
    digitalWrite(X_PINS[i], LOW);
    delay(SENSE_DELAY);
    
    for (int j = 0; j < N; j++) {
      GRID[i][j] = digitalRead(Y_PINS[j]);
    }
    
    pinMode(X_PINS[i], INPUT);
    delay(SENSE_DELAY);
  }
}

void loop() {
  senseGrid();   // Sense current state of grid
  compareGrid(); // Compare with previous state and send any changes
  storeGrid();   // Store current state for next iteration
  delay(DEBOUNCE_DELAY); // Wait for debounce
}
```

---

## Design Challenges & Engineering Trade-offs

During development, we encountered several mechanical and electrical challenges that required trade-offs or highlighted areas for future revision:

### 1. Keyboard Matrix & Ghosting Issues
The initial keyboard matrix design did not include isolation diodes between the row and column channels. Consequently, the matrix suffers from "phantom key presses" (ghosting) and cannot accurately detect when multiple pieces are active on the board at the same time. 

**The Fix:** This issue can be resolved in a future hardware iteration by adding blocking diodes in the matrix at each switch intersection between the row and column channels. For a detailed explanation of keyboard matrix ghosting and this circuit fix, refer to the [Keyboard Matrix Guide](https://www.gammon.com.au/forum/?id=14175).


### 2. Laser Cutting & Material Usage
We faced unexpected issues when laser cutting the chessboard and pieces:
* **Inconsistent Cutting:** The laser cutter did not consistently penetrate the wood, which was especially problematic given the high number of small, detailed pieces that needed to be cut.
* **Material Waste:** While the original nested design was optimized to fit onto a single $12 \times 24\text{ in}^2$ wood sheet, we had to use multiple sheets to compensate for failed or incomplete cuts.
* **Chess Piece Files:** The 2D chess piece shapes were adapted and borrowed from the [DXF Downloads Chess Set Template](https://www.dxfdownloads.com/free-2d-dxf-laser-cut-chess-set/).

### 3. Magnetic Contacts & Sensitivity
The prototype successfully registers piece positions when sufficient downward pressure is applied to the contact grid. To improve reliability and make the board less sensitive to minor alignment errors, stronger and higher-quality magnets should be integrated directly into the bases of the chess pieces and the board.

---

## Team
This project was co-developed by **Siddharth Sahay** and **Shashank Obla**.
