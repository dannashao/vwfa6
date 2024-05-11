# Archived works on molecular dynamics simulation component for targeted ADAMTS13 antibody design

## Background
The goal of the whole experiment is to utilize the recognition and cleavage mechanism between von Willebrand factor (vWF) and a disintegrin and metalloproteinase with a thrombospondin type 1 motif, member 13 (ADAMTS13) to develop antibody drug targeting ADAMTS13 that inhibit their interactions, and thereby inhibiting the hydrolysis of vWF to enhance the adhersion between vWF and platelets, promoting thrombosis and haemostasis in order to treat bleeding disorders such as von Willebrand Disease (vWD) or Thrombotic thrombocytopenic purpura (TTP).

In the previous studies, Gao et al.[[1]](#1) confrimed the residues 1653-1668 on vWF-A2 are involved in the recognition process and and effective recognition can significantly improve the enzyme digestion efficiency. Akiyama et al.[[2]](#2) proposed three key external binding sites, of which the 1653-1668 sequence on vWF is just on an α helix at the C terminus of vWF-A2 (α6 helix). Fang et al.[[3]](#3) constructed a docking model of ADAMTS13-Spacer and vWF-A2-α6 through MD, and predicted a series of key residues: 1653, 1663, 1657, 1661, 1662, 1664, and 1665. In addition, the interaction between Spacer-α6 is mainly a hydrophobic interaction.

Based on these studies, we selected the 1653-1668 fragment of vWF-A2-α6 as the design basis. Through mutating its key residues, we aimed to build an α6 fragment with stronger recognition ability as an antagonist for the recognition and cleavage between vWF and ADAMTS13.

## Introduction
This repository contains code for molecular dynamics (MD) simulation through NAMD and VMD, and the corresponding results on mutating certain residues of α6 and their recognition abilities between the Spacer domain of ADAMTS13.

In the first stage, we extract and combine A1 and A6 into a compled and then performed energy minimization. Then, we perform this again after solvation and ionization of the complex, and obtain a ready-to-use complex for the MD simulations.

The MD simulation are run on the following mutations: D1653A, D1663A, E1655A, E1660V, R1659V, R1659E1660V and wild-type as controlled experiment.

The D1653A, D1663A and E1655A mutation is used for model validation. The results based on the hydrogen bond dissociation rate are consistent with the wet experimental results, that is, the dissociation rate of the E1655A mutant is significantly lower than the wild type, and the dissociation rate of the D1653A and D1663A mutants is significantly higher than the wild type. Therefore, we believe that the model is valid.

After validating the sites in the model have significant effects on bindings, we attempted to find other sites that may affect binding stability. We believe that the polarity of amino acids is a key factor. Based on the previous studies, we selected R1659 and E1660, a pair of adjacent residues with opposite polarity. Meanwhile,  considering the possible influence of spatial structure, we chose valine that has one more methyl group instead of the commonly used alanine as the mutant amino acid.

The results showed that the double mutant R1659E1660V had the lowest RMSD value and the most stable binding trend. Meanwhile, through the intuitive animation with VMD, we found that R1659E1660V α6 helix tends to approach the Spacer domain in parallel ("=" shape), while the wild-type and other single mutant tend to approach it with an angle ("V" shape). We speculate that this may be caused by the expansion of the contact area due to the elimination of polarity.

With these simulation results, the wet lab will prepare corresponding mutants and test their binding abilities with the Spacer domain in reality.

## About
This work is done in the [School of Biology and Biological Engineering](http://www2.scut.edu.cn/biology_en) of South China University of Technology ([SCUT](https://www.scut.edu.cn/en/)) under the supervision of [Dr. Jianhua WU](http://www2.scut.edu.cn/biology_en/2015/0703/c5951a93353/page.htm).

## References
<a id="1">[1]</a>
Gao, Weiqiang, et al. "Exosite interactions contribute to tension-induced cleavage of von Willebrand factor by the antithrombotic ADAMTS13 metalloprotease." Proceedings of the National Academy of Sciences 103.50 (2006): 19099-19104. https://doi.org/10.1073/pnas.0607264104

<a id="2">[2]</a>
Akiyama, Masashi, et al. "Crystal structures of the noncatalytic domains of ADAMTS13 reveal multiple discontinuous exosites for von Willebrand factor." Proceedings of the National Academy of Sciences 106.46 (2009): 19274-19279. https://doi.org/10.1073/pnas.0909755106

<a id="3">[3]</a>
Fang, Xiang, et al. "Prediction of spacer-α6 complex: a novel insight into binding of ADAMTS13 with A2 domain of von Willebrand factor under forces." Scientific Reports 8.1 (2018): 5791. https://doi.org/10.1038/s41598-018-24212-6
