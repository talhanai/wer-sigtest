#!/bin/bash

# scratch=/data/sls/scratch/tuka/gale/kaldi/s5
# work=/usr/users/tuka/recognizer/gale/kaldi/s5

# hyp=$scratch/exp/bw/grapheme/tri3/decode_eval
# ref=$work/data/bw/eval/text
# min=13

# sig-test for diacritics lexicon.
# ----------------------------------
# hyp=$scratch/exp/bw/grapheme/tri3/decode_eval
# min=13
# ../../scripts/get-kaldi-hyp.sh diac $hyp $ref $min $min 
# cp diac/13.hyp.tag.idless hyp.baseline.trn
# cp diac/13.ref.tag.idless ref.trn
sclite -F -i wsj -r ref.trn -h hyp.A.trn -o sgml


# hyp=$scratch/exp/bw/grapheme_mada/tri3/decode_eval
# min=22
# ../../scripts/get-kaldi-hyp.sh diac $hyp $ref $min $min
# cp diac/$min.hyp.tag.idless hyp.all-diac.trn
# cp diac/$min.ref.tag.idless ref.trn
sclite -F -i wsj -r ref.trn -h hyp.B.trn -o sgml
# cat hyp.A.trn.sgml hyp.all-diac.trn.sgml | sc_stats -p -t mcn -v -u -n result.all-diac.mcn
cat hyp.A.trn.sgml hyp.B.trn.sgml | sc_stats -p -t mapsswe -v -u -n result.A-B.mapsswe
