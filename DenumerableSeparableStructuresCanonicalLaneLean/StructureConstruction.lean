import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure CountableBasisPackage where
  basisCountable : Prop
  basisSeparatesPoints : Prop
  basisOpenSets : Prop
  basisCoveredByCountable : Prop

structure CountableBasisEvidence (B : CountableBasisPackage) where
  basisCountableClosed : B.basisCountable
  basisSeparatesPointsClosed : B.basisSeparatesPoints
  basisOpenSetsClosed : B.basisOpenSets
  basisCoveredByCountableClosed : B.basisCoveredByCountable

def CountableBasisClosed (B : CountableBasisPackage) : Prop :=
  B.basisCountable ∧ B.basisSeparatesPoints ∧ B.basisOpenSets ∧ B.basisCoveredByCountable

theorem countable_basis_closed_from_evidence (B : CountableBasisPackage) (E : CountableBasisEvidence B) :
    CountableBasisClosed B := by
  exact And.intro E.basisCountableClosed (And.intro E.basisSeparatesPointsClosed (And.intro E.basisOpenSetsClosed E.basisCoveredByCountableClosed))

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse