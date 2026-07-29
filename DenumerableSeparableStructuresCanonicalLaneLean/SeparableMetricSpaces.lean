import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure SeparableMetricSpacePackage where
  carrier : Type u
  metric : carrier → carrier → ℝ
  metricPositiveDefinite : ∀ x y, metric x y = 0 ↔ x = y
  metricSymmetric : ∀ x y, metric x y = metric y x
  metricTriangleInequality : ∀ x y z, metric x z ≤ metric x y + metric y z
  countableDenseSubset : ∃ (S : Set carrier), Set.Countable S ∧ Dense S

structure SeparableMetricSpaceEvidence (P : SeparableMetricSpacePackage) where
  metricPositiveDefiniteClosed : P.metricPositiveDefinite
  metricSymmetricClosed : P.metricSymmetric
  metricTriangleInequalityClosed : P.metricTriangleInequality
  countableDenseSubsetClosed : P.countableDenseSubset

def SeparableMetricSpaceClosed (P : SeparableMetricSpacePackage) : Prop :=
  P.metricPositiveDefinite ∧ P.metricSymmetric ∧ P.metricTriangleInequality ∧ P.countableDenseSubset

theorem separable_metric_space_closed_from_evidence (P : SeparableMetricSpacePackage)
    (E : SeparableMetricSpaceEvidence P) : SeparableMetricSpaceClosed P := by
  exact And.intro E.metricPositiveDefiniteClosed
    (And.intro E.metricSymmetricClosed
      (And.intro E.metricTriangleInequalityClosed E.countableDenseSubsetClosed))

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse