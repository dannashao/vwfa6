# Stage 1: Combine and minimize chain a1 and a6
In this step, the chain A1 and A6 is extracted and combined into a complex, then perform energy minimization.

## Initial files:
- Base structure files: `A1.pdb`, `A6.pdb`
- Config file: `min_alpha6-side.conf`
- Config scripts: `psfgen2_A1A6.inp`, `Fixgen`
- Force fields: `par_all27_prot_lipid.inp`, `top_all27_prot_lipid.inp`

## Step 1: Create standard psf and pdb file for A1A6
1. load `A1A6.pdb` in VMD
2. Input `source psfgen2_A1A6.inp` in TkConsole to generate `A1A6.pdb`,`A1A6.psf`

## Step 2: Create boundaries:
Input `source Fixgen` in TkConsole to obtain `alpha6_side.fix`,`alpha6.fix`

## Step 3: Measure molecular parameters
1. Input `measure center [atomselect top all]` and `measure minmax [atomselect top all]` in TkConsole
2. Obtain two sets of parameters: \
Center: `6.665901184082031 70.56932067871094 -2.120300769805908` \
Edges: `{-10.182999610900879 41.53499984741211 -28.513999938964844}, {24.51099967956543 98.47000122070313 19.68600082397461}` \
Calculate and obtain `x=34.694 y=56.935 z=48.200`

## Step 4: Minimize under A and Backbone locked (side chain minimization)
1. Modify `min_alpha6-side.conf` with the calculated coordinates on line 51 to 54:
```
51    cellBasisVector1     34.694    0.        0.
52    cellBasisVector2     0.        56.935    0.
53    cellBasisVector3     0.        0.        48.200
54    cellOrigin           6.666     70.569    -2.120
```
2. Run NAMD with the `.conf .log` command to run minimization and generate series of files (`.coor .dcd .vel .xsc .xsc .log`)

## Step 5: Minimize under only A is locked
1. Modify `min_alpha6-side.conf` and save as `min_alpha6.conf`:
```
13    #coordinates        A1A6.pdb
14    outputName          min_alpha6
19    if {1} {
20    set inputname       min_alpha6_side
29    restartname         min_alpha6_res
108   DCDfile             min_alpha6.dcd
112   XSTfile             min_alpha6.xst
123   fixedAtomsFile      alpha6.fix
```
2. Comment the flllowing lines: 44,51,52,53,54 to cancel the initial tempreture and coordinate settings
3. Run NAMD to do the second round of minimization

## *On operations that split a .coor into two pdb and combine:
```
mol load pdb min_alpha6.coor
[atomselect top "segname A1"] writepdb A1.pdb
[atomselect top "segname A6"] writepdb A6.pdb

package require psfgen
topology top_all27_prot_lipid.inp
source psfgen2_A1A6.inp
```
