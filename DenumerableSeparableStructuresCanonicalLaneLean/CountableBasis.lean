import canonicalLaneMathlib.AdmissibleClass
import DenumerableSeparableStructuresCanonicalLaneLean.DenumerableSeparableStructures

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure CountableBasisPackage (S : DenumerableSeparableStructure) where
  basisSet : Set (Set S.carrier)
  basisCountable : Set.Countable basisSet
  basisOpen : ∀ U ∈ basisSet, IsOpen U
  basisGenerated : IsTopologicalBasis basisSet

structure CountableBasisEvidence (S : DenumerableSeparableStructure) (B : CountableBasisPackage S) where
  basisCountableClosed : B.basisCountable
  basisOpenClosed : B.basisOpen
  basisGeneratedClosed : B.basisGenerated

def CountableBasisClosed (S : DenumerableSeparableStructure) (B : CountableBasisPackage S) : Prop :=
  B.basisCountable ∧ B.basisOpen ∧ B.basisGenerated

theorem countable_basis_closed_from_evidence (S : DenumerableSeparableStructure) (B : CountableBasisPackage S) (E : CountableBasisEvidence S B) : CountableBasisClosed S B := by
  exact And.intro E.basisCountableClosed (And.intro E.basisOpenClosed E.basisGeneratedClosed)

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse