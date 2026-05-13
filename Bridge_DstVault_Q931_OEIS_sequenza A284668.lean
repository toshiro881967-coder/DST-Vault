import DSTVault

/-
Copyright (c) 2026 DST-Vault Core.
Author: Francesco Panascì (Italy)
All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-/


-- Motore di calcolo: mantiene la logica Collatz integrata con il Vault 3.0
def collatzStep (n : Nat) : Nat :=
  if n % 2 == 0 then n / 2 else 3 * n + 1

/- 
  Funzione ricorsiva ottimizzata.
  Restituisce il percorso completo per l'analisi dell'Apogeo.
-/
partial def findVaultPath (n : Nat) (steps : Nat) (cache : DSTCache) (path : List (Nat × Float)) : IO (List (Nat × Float)) := do
  let (gap, newCache) := getEntropyGapDP n cache
  let currentPair := (n, gap)
  let updatedPath := currentPair :: path
  
  if n <= 1 ∨ steps > 10000 then 
    return updatedPath.reverse 
  else
    let nextN := if gap < 0.35 then n / 2 else collatzStep n
    findVaultPath nextN (steps + 1) newCache updatedPath

-- Funzione di supporto per trovare il valore massimo nel percorso
def getApogee (path : List (Nat × Float)) : Nat :=
  path.foldl (λ acc (n, _) => if n > acc then n else acc) 0

def main : IO Unit := do
  /- 
    IL SUPER-TITANO (Record Holder > 1300 passi)
    Target: 931.386.509.544.713.451
  -/
  let startNode : Nat := 931386509544713451
  let initialCache : DSTCache := InitialCache 
  
  -- Esecuzione del calcolo
  let results ← findVaultPath startNode 0 initialCache []
  
  -- Analisi dei risultati
  let apogee := getApogee results
  let totalSteps := results.length - 1 -- Sottraiamo 1 per avere i passi effettivi
  
  -- Output del Report (Leggibile per l'utente)
  IO.println "----------------------------------------"
  IO.println s!"REPORT DI MISSIONE: SUPER-TITANO"
  IO.println s!"Valore Iniziale : {startNode}"
  IO.println s!"Passi Effettivi : {totalSteps}"
  IO.println s!"APOGEO MASSIMO : {apogee}"
  IO.println "----------------------------------------"
  
  -- Output per lo script Python (Inizio Dati)
  IO.println "START_DATA"
  IO.println "Frequenza,EntropyGap,IsResonant"
  
  for (f, gap) in results do
    let isResonant := if gap < 0.4 then 1 else 0
    IO.println s!"{f},{gap},{isResonant}"
    
  IO.println "END_DATA"