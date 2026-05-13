import subprocess
import matplotlib.pyplot as plt
import pandas as pd
import io



# Copyright (c) 2026 DST-Vault Core.
# Author: Francesco Panascì (Italy)
# All rights reserved.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.



def run_vault_bridge():
    # Esegue il comando Lean
    result = subprocess.run(['lake', 'exe', 'bridge'], capture_output=True, text=True)
    
    if result.returncode != 0:
        print("Errore nell'esecuzione di Lean:", result.stderr)
        return

    # Estrazione dati tra START_DATA e END_DATA
    raw_data = result.stdout.split("START_DATA")[1].split("END_DATA")[0].strip()
    
    # Caricamento in Pandas
    df = pd.read_csv(io.StringIO(raw_data))
    return df

def plot_results(df):
    plt.figure(figsize=(12, 6))
    
    # Grafico della discesa (Valore del frammento)
    ax1 = plt.gca()
    ax2 = ax1.twinx()
    
    ax1.plot(df.index, df['Frequenza'], 'g-o', label='Traiettoria (Valore)', markersize=4)
    ax2.plot(df.index, df['EntropyGap'], 'r--', label='Gap di Entropia (Fatica)', alpha=0.6)
    
    ax1.set_yscale('log')
    ax1.set_xlabel('Passi di Ragionamento (Time)')
    ax1.set_ylabel('Energia del Frammento', color='g')
    ax2.set_ylabel('Attrito Informativo (Gap)', color='r')
    
    plt.title("Simulazione DST-Vault: Caduta verso l'Equilibrio")
    ax1.grid(True, which="both", ls="-", alpha=0.3)
    plt.show()

# Esecuzione
data = run_vault_bridge()
if data is not None:
    print(data)
    plot_results(data)