# Stage 2: Minimize with Solvation and Ionization

## Initial files:
- Base structure files: `A1A6.pdb`, `A1A6.psf`
- Config file: `min_P.conf`,`min_backbone.conf`,`min_all.conf`
- Script: `wat_ion.tcl`
- Force fields: `par_all27_prot_lipid.inp`, `top_all27_prot_lipid.inp`

## Step 1: Solvation and ionization
1. Run the `wat_ion.tcl` to obtain the following files:\
Solvation: `A1A6_ws.pdb`, `A1A6_ws.psf`\
Ionization: `A1A6_ion.pdb`,`A1A6_ion.psf`\
Boundaries: `protein.fix`,`backbone.fix`\
2. Obtain two sets of parameters: \
Center: `6.848893165588379 70.53417205810547 -1.9476786851882935` \
Edges: `{-25.177000045776367 36.939998626708984 -35.61600112915039}, {39.391998291015625 103.80899810791016 31.732999801635742}` \
Calculate and obtain `x=64.569 y=66.869 z=67.345`

## Step 2: Minimize with protein locked
Same as before, use `min_P.conf > min_P.log` in NAMD

## Step 3: Minimize with backbone locked
Similarly, use `min_backbone.conf`