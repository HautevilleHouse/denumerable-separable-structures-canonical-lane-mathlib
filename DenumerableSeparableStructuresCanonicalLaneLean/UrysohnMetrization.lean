import canonicalLaneMathlib.AdmissibleClass
import DenumerableSeparableStructuresCanonicalLaneLean.DenumerableSeparableStructures
import DenumerableSeparableStructuresCanonicalLaneLean.CountableBasis

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure UrysohnMetrizationPackage (S : DenumerableSeparableStructure) (B : CountableBasisPackage S) where
  urysohnFunctions : Nat → C(S.carrier, ℝ)
  embedding : C(S.carrier, ℝ^ℕ)
  isMetric : Prop
  metrizable : Prop

structure UrysohnMetrizationEvidence (S : DenumerableSeparableStructure) (B : CountableBasisPackage S) (U : UrysohnMetrizationPackage S B) where
  isMetricClosed : U.isMetric
  metrizableClosed : U.metrizable

def UrysohnMetrizationClosed (S : DenumerableSeparableStructure) (B : CountableBasisPackage S) (U : UrysohnMetrizationPackage S B) : Prop :=
  U.isMetric ∧ U.metrizable

theorem urysohn_metrization_closed_from_evidence (S : DenumerableSeparableStructure) (B : CountableBasisPackage S) (U : UrysohnMetrizationPackage S B) (E : UrysohnMetrizationEvidence S B U) : UrysohnMetrizationClosed S B U := by
  exact And.intro E.isMetricClosed E.metrizableClosed

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse