# Counter DFT & ATPG (FULLSCAN)

This repository demonstrates a complete **Design-for-Testability (DFT)** and  
**Automatic Test Pattern Generation (ATPG)** flow for a **sequential counter design**
using an industry-standard digital implementation toolchain.

The project covers scan insertion, FULLSCAN ATPG, and post-DFT verification,
following best practices used in real-world VLSI design and test flows.

---

## 📌 Project Overview

**Design:** Sequential Counter  
**Test Methodology:** FULLSCAN  
**Focus Areas:**
- Scan insertion
- ATPG vector generation
- Fault coverage readiness
- Post-DFT verification

This repository is structured to be **reproducible**, **clean**, and **IP-safe**.

---

## 🔁 Design Flow

RTL
→ Logic Synthesis
→ DFT (Scan Insertion)
→ Scan Netlist Generation
→ ATPG (FULLSCAN)
→ Test Vector Generation
→ Verification
---

## 🛠 Tools & Methodology (IP-SAFE)

- Logic synthesis with integrated DFT support
- FULLSCAN ATPG for stuck-at fault modeling
- Scan-based verification flow
- Formal equivalence checking (RTL vs scan netlist)

> ⚠️ **Note:**  
> Tool names, versions, technology nodes, standard-cell libraries,
> memory macros, and PDK details are intentionally omitted
> to protect proprietary and licensed IP.

---

## 📂 Repository Structure

```text
counter_dft_atpg/
├── README.md                # Project documentation (IP-safe)
├── .gitignore
│
├── scripts/                 # Synthesis, DFT & ATPG control scripts
│   ├── counter_lab1.tcl
│   ├── counter_lab2.tcl
│   ├── genus.cmd
│   └── modus.cmd
│
├── netlist/                 # Scan-inserted design outputs
│   ├── counter.test_netlist.v
│   └── counter.FULLSCAN.pinassign
│
├── reports/                 # DFT analysis reports
│   ├── DFTsetup_final.rpt
│   ├── DFTchains_final.rpt
│   ├── DFTregs_final.rpt
│   └── scanDEF.def
│
├── fv/                      # Formal verification (RTL vs scan netlist)
│   └── counter/
│       ├── rtl_to_fv_map.do
│       ├── read_libs.tcl
│       ├── fv_map.map.do
│       └── fv_map.fv.json
│
├── MODUS_RUN_COUNTER/       # ATPG execution & generated test artifacts
│   └── testresults/
│       └── verilog/         # ATPG vectors & simulation models
│
└── LIBS/
    └── README.md            # Placeholder (proprietary libraries excluded)

---

## 📊 DFT Highlights

- FULLSCAN architecture
- All sequential elements converted to scan flops
- Explicit scan chain definition
- ATPG-ready scan netlist
- Separation of logic and scan test modes

Detailed results are available in the `reports/` directory.

---

## 🔍 Verification

- Formal equivalence checking between:
  - Original RTL
  - Scan-inserted netlist
- Ensures functional correctness is preserved after DFT insertion

---



