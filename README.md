# 8-Bit Linear Feedback Shift Register (LFSR)

## Overview

This project implements an 8-Bit Linear Feedback Shift Register (LFSR) using Verilog HDL. The design generates pseudorandom binary sequences using configurable feedback taps defined through a programmable polynomial register.

The implementation supports seed loading, polynomial loading, enable control, state holding, and pseudorandom sequence generation. The feedback path is generated using XOR operations on selected register taps, allowing different LFSR configurations to be evaluated.

The project includes RTL design, functional verification using a testbench, simulation waveform generation, logic synthesis, and synthesized RTL schematics.

The functionality and theory of operation were studied using a reference document on Linear Feedback Shift Registers (LFSRs).

Reference Document: :contentReference[oaicite:0]{index=0}

---

## Design Specifications

- 8-Bit LFSR
- Programmable Feedback Polynomial
- Configurable Seed Loading
- Pseudorandom Sequence Generation
- Enable and Hold Functionality
- Synchronous State Update
- D Flip-Flop Based Architecture

---

## Tools Used

- Quartus II for RTL Design and Logic Synthesis
- ModelSim-Altera for Simulation and Waveform Generation
- Verilog HDL

---

## Features

- Programmable feedback tap selection
- Configurable seed initialization
- Pseudorandom bit sequence generation
- Dynamic polynomial loading
- Enable and hold state operation
- Modular D Flip-Flop architecture
- Real-time state monitoring
- Functional verification through simulation

---

## RTL Design Description

The LFSR is implemented using eight D Flip-Flops connected as a shift register with a programmable feedback network.

### Internal Architecture

- Eight D Flip-Flops store the current state
- Polynomial register stores feedback tap locations
- XOR-based feedback generation
- Seed loading mechanism for initialization
- Enable control for shifting operation
- State hold capability when shifting is disabled

### Control Signals

#### Seed Load (`seedload`)
Loads the user-defined seed value into the LFSR.

#### Polynomial Load (`polyload`)
Loads the feedback polynomial used to generate the feedback bit.

#### Enable (`enable`)
Controls whether the register advances to the next state or holds its current state.

#### Reset (`reset`)
Clears the register contents and polynomial register.

---

## Functional Description

The LFSR generates pseudorandom sequences by shifting register contents and inserting a feedback bit generated from selected tap positions.

### Initialization

1. Load an initial seed value.
2. Load a feedback polynomial.
3. Enable shifting operation.

### Sequence Generation

- Selected taps are XORed together to generate the feedback bit.
- Register contents shift by one position every clock cycle.
- The generated feedback bit is inserted into the least significant stage.
- A new pseudorandom state is generated on each clock edge.

### Hold Operation

When the enable signal is LOW:
- Current state remains unchanged.
- Sequence generation is paused.

---

## Testbench Verification

The testbench verifies:

- Reset functionality
- Seed loading operation
- Polynomial loading operation
- Feedback generation
- State transitions
- Hold functionality
- Re-enable operation
- Pseudorandom sequence generation

### Test Configuration

#### Seed Value

```text
01h
```

#### Feedback Polynomial

```text
B8h
```

Selected taps:

```text
[7, 5, 4, 3]
```

The design is simulated for multiple clock cycles to verify proper state evolution and sequence generation.

Simulation is performed using ModelSim-Altera.

---

## Simulation Results

Waveform analysis confirms:

- Successful seed loading
- Correct polynomial loading
- Accurate feedback generation
- Proper state shifting
- Correct hold-state operation
- Successful re-enabling of sequence generation
- Expected pseudorandom output sequence

---

## Synthesis Results

Logic synthesis is performed using Quartus II.

Synthesis outputs include:

- RTL schematic
- Logic synthesis report

---

## Theory of Operation

A Linear Feedback Shift Register (LFSR) is a shift register whose feedback input is generated using XOR combinations of selected register outputs.

When initialized with a non-zero seed value, the LFSR produces a deterministic pseudorandom sequence of binary values. The generated sequence depends on:

- Register length
- Initial seed value
- Feedback polynomial

LFSRs are widely used for pseudorandom pattern generation, Built-In Self-Test (BIST), digital communications, and cryptographic applications.

---

## Applications

- Pseudorandom number generation
- Built-In Self-Test (BIST)
- Scan chain testing
- Digital communication systems
- Data scrambling
- Error detection systems
- Cryptographic preprocessing
- FPGA and ASIC verification

---

## Author

Shaan Garg 
