import PureSFormal.Cook.PassDecoder

/-!
# Axiom audit for the direct Cook boundary decoder

These declarations are the public roundtrip, uniqueness, and soundness
surface of `PassDecoder`.  The expected output contains at most `propext`;
in particular, no declaration below depends on `Quot.sound` or
`Classical.choice`.
-/

namespace PureSFormal.Cook

#print axioms decodeCanonical?_eq_some_iff
#print axioms canonicalWord_injective

#print axioms decodeArrival?_validArrivalWord
#print axioms arrivalWord_valid_unique
#print axioms arrivalReadable_iff_decodeArrival?_isSome

#print axioms decodeOneHot?_oneHot
#print axioms decodeOneHot?_sound
#print axioms decodeWord?_encodeWord
#print axioms decodeWord?_sound

#print axioms passDecode?_canonical
#print axioms passDecode?_validArrival
#print axioms passDecode?_of_phase_ne_zero
#print axioms passDecode?_positive_canonical_none
#print axioms passDecode?_zero_arrival_none
#print axioms passDecode?_sound

end PureSFormal.Cook
