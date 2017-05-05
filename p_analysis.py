#! usr/bin/env python

from Bio import SeqIO
from Bio.SeqUtils import ProtParam

handle = open("examplefasta.fasta") 
for record in SeqIO.parse(handle, "fasta"): 
    seq = str(record.seq)
    X = ProtParam.ProteinAnalysis(seq)
    print X.count_amino_acids() 
    print X.get_amino_acids_percent() 
   #print X.molecular_weight() 
   #print X.aromaticity() 
   #print X.instability_index() 
   #print X.flexibility() 
   #print X.isoelectric_point() 
   #print X.secondary_structure_fraction()
    
   
sys.exit()
