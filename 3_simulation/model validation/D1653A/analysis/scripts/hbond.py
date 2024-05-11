import MDAnalysis as mda
import MDAnalysis.analysis.hbonds

u = MDAnalysis.Universe('D1653A_ion.psf', 'D1653A_equ1.dcd')
h = MDAnalysis.analysis.hbonds.HydrogenBondAnalysis(u, 'segid AL6', 'segid SPA', distance=3.5, angle=30)
h.run()

h.generate_table()

import pandas as pd
df = pd.DataFrame.from_records(h.table)
df.to_csv('hbonds.csv')