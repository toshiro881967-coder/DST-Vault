# DST-Vault Core v3.5 - Temporal Persistence Edition

This repository contains the formalization of **Dual Sets Theory (DST)**, an axiomatic framework developed in **Lean 4**.

![DST-Vault Core Diagram](DST-Vault-Diagram_of_the_Theory.jpg)

## Project Status: Formal Axiomatic Refactoring (v3.5.2)
We are currently transitioning from a conceptual framework to a rigorous bottom-up formalization. The goal is to verify the logical consistency of DST axioms, moving from basic set theory to complex biological resonance models.

## The Axiomatic Foundation
The theory is built upon a hierarchical set of axioms that define the nature of existence, duality, and field equilibrium.

### Foundations (Axioms 0-2)
* **Axiom 0:** Universal Existence (The Vault).
* **Axiom 1 & 2:** Duality Mapping and Uniqueness.
![Axiom 0 - The Vault](Axiom_0_The_Vault.jpg)
*Formal proof of duality uniqueness has been implemented in the `DST_Space` structure.*

### Universal Comparisons
DST applies across multiple domains, from particle physics to number theory.
![Duality Comparisons](Axioms_1_2_Comparisons.jpg)

### Polarity & Field Dynamics (Axioms 3-4)
* **Axiom 3 (Polarity):** Defines the "Sphere & Void" relationship. Balanced tension creates system stability.
![Axiom 3 - Polarity](Axiom_3_Polarity.jpg)
* **Axiom 4 (The Field Equation):** Formalizes the Equilibrium Center ($E$) and the Field Equation: $$x + \text{dual}(x) = E$$
![Axiom 4 - Field Equation](Axiom_4_Field_Equation.jpg)

### System Composition & Coupling (Axiom 5)
* **Axiom 5 (The Coupling Axiom):** Defines the formal mechanism for system interaction. In DST, the dual of a paired system is the pair of its individual duals: 
$$\text{dual}(x, y) = (\text{dual}(x), \text{dual}(y))$$
This allows for the creation of **Neutral Autodual Complexes**, essential for modeling stable interactions such as drug-target binding or coherent photon states.

![Axiom 5](Axiom_5_System_Composition_Coupling.jpg)
*The composition operator ensures that information conservation ($\iota$) is maintained even when independent Vaults are coupled into a Product Space.*

### Temporal Persistence & Entropy Decay (Axiom 06)
* **Axiom 06 (The Maintenance Rule):** Defines how resonance behaves over time ($\tau$). A system stays 'Neutral' (Stable) as long as the Resonance Frequency counteracts Environmental Entropy.
![Axiom 06 - Temporal Persistence](Axiom_06_Temporal_Persistence.jpg)
* **The Biological Metronome Effect:** Formalizes why systems based on **Primorial Anchors (210, 2310)** exhibit a decay rate ($d < 0.01$) that ensures long-term homeostatic stability. This explains the numerical "preference" in biological coding like DNA.

## Abstract
DST-Vault explores the intersection of number theory, informational entropy, and biological resonance. By utilizing Lean 4's formal verification, this project provides a mathematical foundation for Dual Superposition and Homeostatic Tunneling, specifically focusing on how the stability of biological systems like DNA or protein-ligand complexes can be modeled through involutive duality.

## Key Features
* **Axiomatic Logic:** A structured "Logical Engine" defining the universe (Vault) and the fundamental **dual** operator.
* **Formal Verification:** Proven theorems regarding the uniqueness of dual elements and geometric symmetry of the field.
* **Multi-Field Validation:** Validation of bounded curvature across Real ($\mathbb{R}$) and Complex ($\mathbb{C}$) fields.
* **Primorial Resonance:** Research into the role of primorial frequencies (e.g., 210, 2310) in minimizing system entropy.

## Technical Specifications
* **Lean Version:** Lean 4 (v4.30.0-rc2).
* **Environment:** Fully compatible with Mathlib4.
* **Build:** `lake build`
