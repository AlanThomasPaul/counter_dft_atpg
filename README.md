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

counter_dft_atpg/
├── README.md
├── .gitignore
│
├── scripts/
│ ├── counter_lab1.tcl # DFT & synthesis control script
│ ├── counter_lab2.tcl # ATPG preparation flow
│ ├── genus.cmd # Synthesis command file
│ └── modus.cmd # ATPG command file
│
├── netlist/
│ ├── counter.test_netlist.v # Scan-inserted netlist
│ └── counter.FULLSCAN.pinassign
│
├── reports/
│ ├── DFTsetup_final.rpt
│ ├── DFTchains_final.rpt
│ ├── DFTregs_final.rpt
│ └── scanDEF.def
│
├── fv/
│ └── counter/
│ ├── rtl_to_fv_map.do
│ ├── read_libs.tcl
│ ├── fv_map.map.do
│ └── fv_map.fv.json
│
├── MODUS_RUN_COUNTER/
│ └── testresults/
│ └── verilog/ # ATPG simulation models & vectors
│
└── LIBS/
└── README.md # Placeholder for proprietary libraries
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

## 🔒 IP & Security Notice

To maintain **academic and professional integrity**, this repository:

- ❌ Does **NOT** include:
  - Technology libraries
  - Standard cell definitions
  - Memory macros
  - Timing libraries
  - Tool installation paths
  - Machine IP addresses or hostnames
- ✅ Uses placeholders where proprietary inputs are required

This makes the repository **safe for public sharing**.

---

## 🎯 Learning Outcomes

- Practical understanding of scan-based DFT
- Hands-on ATPG flow exposure
- Experience with industry-style tool scripting
- Clean, version-controlled VLSI project structure

---

## 📎 Disclaimer

This project is for **educational and demonstrative purposes only**.  
All proprietary elements have been removed or abstracted.


