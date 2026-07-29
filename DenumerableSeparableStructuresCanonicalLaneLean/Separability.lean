import canonicalLaneMathlib.AdmissibleClass
import DenumerableSeparableStructuresCanonicalLaneLean.DenumerableSeparableStructures

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure SeparabilityPackage (S : DenumerableSeparableStructure) where
  denseSet : Set S.carrier
  denseCountable : Set.Countable denseSet
  denseClosure : closure denseSet = Set.univ

structure SeparabilityEvidence (S : DenumerableSeparableStructure) (P : SeparabilityPackage S) where
  denseCountableClosed : P.denseCountable
  denseClosureClosed : P.denseClosure

def SeparabilityClosed (S : DenumerableSeparableStructure) (P : SeparabilityPackage S) : Prop :=
  P.denseCountable ∧ P.denseClosure

theorem separability_closed_from_evidence (S : DenumerableSeparableStructure) (P : SeparabilityPackage S) (E : SeparabilityEvidence S P) : SeparabilityClosed S P := by
  exact And.intro E.denseCountableClosed E.denseClosureClosed

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse