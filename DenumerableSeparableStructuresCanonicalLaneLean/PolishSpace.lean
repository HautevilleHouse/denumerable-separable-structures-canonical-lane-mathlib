import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure PolishSpace where
  carrier : Type u
  topology : TopologicalSpace carrier
  separable : Prop
  completelyMetrizable : Prop
  metric : MetricSpace carrier
  complete : CompleteSpace carrier

structure PolishEvidence (P : PolishSpace) where
  separableClosed : P.separable
  completelyMetrizableClosed : P.completelyMetrizable

def PolishClosed (P : PolishSpace) : Prop :=
  P.separable ∧ P.completelyMetrizable

theorem polish_closed_from_evidence (P : PolishSpace) (E : PolishEvidence P) : PolishClosed P := by
  exact And.intro E.separableClosed E.completelyMetrizableClosed

structure UniversalPolishSpace where
  polish : PolishSpace
  universalProperty : ∀ (Q : PolishSpace), ∃ (f : Q.carrier → polish.carrier), Embedding f

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse
