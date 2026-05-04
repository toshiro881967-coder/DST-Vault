import Lake
open Lake DSL

package «dst-vault» where
  -- Impostazioni pacchetto

require mathlib from git
  "https://github.com/leanprover-community/mathlib4"

lean_lib «DstVault» where
  -- Impostazioni libreria