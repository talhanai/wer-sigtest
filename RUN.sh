#!/bin/bash

# generate SGML file between reference and hypothesis A
sclite -F -i wsj -r ref.trn -h hyp.A.trn -o sgml

# generate SGML file between reference and hypothesis B
sclite -F -i wsj -r ref.trn -h hyp.B.trn -o sgml

# compare hypotheses and perform significance test of MAPSSWE
cat hyp.A.trn.sgml hyp.B.trn.sgml | sc_stats -p -t mapsswe -v -u -n result.A-B.mapsswe
