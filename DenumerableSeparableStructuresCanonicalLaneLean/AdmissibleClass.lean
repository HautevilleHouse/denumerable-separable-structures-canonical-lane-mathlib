import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure AdmissibleClass where
  object : DenumSepAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DenumSepWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse