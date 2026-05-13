import Mathlib.Data.Nat.Basic
import Mathlib.Data.Nat.Sqrt

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

/- 

  DST-Vault: Adaptive Resonant Engine (Versione 3.0 - Galactic Scale)
  Specificamente calibrato per numeri nell'ordine di 2^60 e oltre.
-/

def DSTCache := List (Nat × Float)
def InitialCache : DSTCache := []

def getEntropyGapDP (n : Nat) (cache : DSTCache) : (Float × DSTCache) :=
  -- LOGICA ADATTIVA 3.0: Quattro stadi di osservazione per scale cosmiche
  let vaultNodes := 
    if n > 1_000_000_000_000_000 then 
      -- Stadio Deep Space: Primoriali giganti (fino al 13° o 15° numero primo)
      [223092870, 6469693230] 
    else if n > 100_000_000 then 
      [30030, 510510, 9699690] 
    else if n > 10_000 then 
      [210, 2310, 30030]       
    else 
      [2, 4, 8, 16, 32, 64]    
      
  -- Verifica risonanza
  let isResonant := vaultNodes.any (fun v => n % v == 0)
  
  -- Identificazione potenze di 2 (cruciale per numeri giganti)
  let isPowerOfTwo := n > 0 && (n &&& (n - 1)) == 0
  
  /-
    Gap Informativo per Scale Galattiche:
    Manteniamo la struttura 2.0 ma con maggiore sensibilità ai super-nodi.
  -/
  let gap := if n <= 1 then 0.0 
             else if isPowerOfTwo then 0.02
             else if isResonant then 0.05 -- Ancora più risonante per i nodi Deep Space
             else if n % 2 == 0 then 0.35 
             else 0.98 
             
  (gap, cache)

def computePrimes (limit : Nat) : Array Bool :=
  Id.run do
    let mut isPrime := Array.mk (List.replicate (limit + 1) true)
    if limit >= 0 then isPrime := isPrime.set! 0 false
    if limit >= 1 then isPrime := isPrime.set! 1 false
    let sqrtLimit := Nat.sqrt limit
    for i in [2 : sqrtLimit + 1] do
      if isPrime.getD i true then
        let mut j := i * i
        while j <= limit do
          isPrime := isPrime.set! j false
          j := j + i
    return isPrime
