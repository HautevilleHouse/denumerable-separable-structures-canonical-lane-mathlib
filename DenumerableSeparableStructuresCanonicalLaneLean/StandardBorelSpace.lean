import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DenumerableSeparableStructuresCanonicalLaneLean.PolishSpaceStructure

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure StandardBorelSpacePackage (M : SeparableMetricSpacePackage) (P : PolishSpacePackage M) where
  borelSigmaAlgebra : MeasurableSpace M.carrier
  borelGeneratedByTopology : borelSigmaAlgebra = MeasurableSpace.generateFrom {U | IsOpen U}
  standardBorelCondition : ∀ (f : M.carrier → ℝ), Measurable f ↔ Continuous f

structure StandardBorelSpaceEvidence (M : SeparableMetricSpacePackage) (P : PolishSpacePackage M)
    (S : StandardBorelSpacePackage M P) where
  borelGeneratedByTopologyClosed : S.borelGeneratedByTopology
  standardBorelConditionClosed : S.standardBorelCondition

def StandardBorelSpaceClosed (M : SeparableMetricSpacePackage) (P : PolishSpacePackage M)
    (S : StandardBorelSpacePackage M P) : Prop :=
  S.borelGeneratedByTopology ∧ S.standardBorelCondition

theorem standard_borel_space_closed_from_evidence (M : SeparableMetricSpacePackage)
    (P : PolishSpacePackage M) (S : StandardBorelSpacePackage M P)
    (E : StandardBorelSpaceEvidence M P S) : StandardBorelSpaceClosed M P S := by
  exact And.intro E.borelGeneratedByTopologyClosed E.standardBorelConditionClosed

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse