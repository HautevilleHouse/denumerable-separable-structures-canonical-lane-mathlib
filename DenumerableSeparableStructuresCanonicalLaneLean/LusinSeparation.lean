import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DenumerableSeparableStructuresCanonicalLaneLean.StandardBorelSpace

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure LusinSeparationPackage (M : SeparableMetricSpacePackage) (P : PolishSpacePackage M)
    (S : StandardBorelSpacePackage M P) where
  A : Set M.carrier
  B : Set M.carrier
  analyticA : AnalyticSet S.borelSigmaAlgebra A
  analyticB : AnalyticSet S.borelSigmaAlgebra B
  disjointAB : Disjoint A B
  separableBorelSets : ∃ (C D : Set M.carrier),
    C ∈ S.borelSigmaAlgebra ∧ D ∈ S.borelSigmaAlgebra ∧ A ⊆ C ∧ B ⊆ D ∧ Disjoint C D

structure LusinSeparationEvidence (M : SeparableMetricSpacePackage) (P : PolishSpacePackage M)
    (S : StandardBorelSpacePackage M P) (L : LusinSeparationPackage M P S) where
  analyticAClosed : L.analyticA
  analyticBClosed : L.analyticB
  disjointABClosed : L.disjointAB
  separableBorelSetsClosed : L.separableBorelSets

def LusinSeparationClosed (M : SeparableMetricSpacePackage) (P : PolishSpacePackage M)
    (S : StandardBorelSpacePackage M P) (L : LusinSeparationPackage M P S) : Prop :=
  L.analyticA ∧ L.analyticB ∧ L.disjointAB ∧ L.separableBorelSets

theorem lusin_separation_closed_from_evidence (M : SeparableMetricSpacePackage)
    (P : PolishSpacePackage M) (S : StandardBorelSpacePackage M P)
    (L : LusinSeparationPackage M P S) (E : LusinSeparationEvidence M P S L) :
    LusinSeparationClosed M P S L := by
  exact And.intro E.analyticAClosed (And.intro E.analyticBClosed
    (And.intro E.disjointABClosed E.separableBorelSetsClosed))

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse