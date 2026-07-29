import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DenumerableSeparableStructuresCanonicalLaneLean.SeparableMetricSpaces
import HautevilleHouse.DenumerableSeparableStructuresCanonicalLaneLean.CountableBasis

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure PolishSpacePackage (M : SeparableMetricSpacePackage) where
  completeMetric : ∀ (f : ℕ → M.carrier), Cauchy f → ∃ x, Filter.Tendsto f Filter.atTop (𝓝 x)
  completeMetricClosed : completeMetric

structure PolishSpaceEvidence (M : SeparableMetricSpacePackage) (P : PolishSpacePackage M) where
  completeMetricClosed : P.completeMetricClosed

def PolishSpaceClosed (M : SeparableMetricSpacePackage) (P : PolishSpacePackage M) : Prop :=
  P.completeMetric

theorem polish_space_closed_from_evidence (M : SeparableMetricSpacePackage)
    (P : PolishSpacePackage M) (E : PolishSpaceEvidence M P) : PolishSpaceClosed M P := by
  exact E.completeMetricClosed

theorem polish_implies_separable_closed (M : SeparableMetricSpacePackage)
    (P : PolishSpacePackage M) (S : SeparableMetricSpaceEvidence M) :
    SeparableMetricSpaceClosed M := by
  exact separable_metric_space_closed_from_evidence M S

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse