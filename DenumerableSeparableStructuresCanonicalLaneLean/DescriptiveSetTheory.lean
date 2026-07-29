import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure AnalyticSet where
  space : Type u
  topology : TopologicalSpace space
  separable : Prop
  continuousImageOfPolish : Prop
  analytic : Prop

structure BorelSet where
  space : Type u
  topology : TopologicalSpace space
  borelGenerated : Prop
  isBorel : Prop

structure DescriptiveFramework where
  analytic : AnalyticSet
  borel : BorelSet
  universalAnalyticSet : Prop
  universalCoanalyticSet : Prop
  separationTheorem : Prop

structure DescriptiveEvidence (D : DescriptiveFramework) where
  analyticClosed : D.analytic.analytic
  borelClosed : D.borel.isBorel
  universalAnalyticClosed : D.universalAnalyticSet
  universalCoanalyticClosed : D.universalCoanalyticSet
  separationClosed : D.separationTheorem

def DescriptiveClosed (D : DescriptiveFramework) : Prop :=
  D.analytic.analytic ∧ D.borel.isBorel ∧ D.universalAnalyticSet ∧ D.universalCoanalyticSet ∧ D.separationTheorem

theorem descriptive_closed_from_evidence (D : DescriptiveFramework) (E : DescriptiveEvidence D) : DescriptiveClosed D := by
  exact And.intro E.analyticClosed
    (And.intro E.borelClosed
      (And.intro E.universalAnalyticClosed
        (And.intro E.universalCoanalyticClosed E.separationClosed)))

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse
