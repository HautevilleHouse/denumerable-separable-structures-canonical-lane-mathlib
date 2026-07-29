import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure BaireCategoryPackage where
  space : DenumerableSeparablePackage
  completeMetrizable : Prop
  baireProperty : Prop
  countableIntersectionOfDenseOpenSetsDense : Prop

structure BaireCategoryEvidence (B : BaireCategoryPackage) where
  completeMetrizableClosed : B.completeMetrizable
  bairePropertyClosed : B.baireProperty
  countableIntersectionOfDenseOpenSetsDenseClosed : B.countableIntersectionOfDenseOpenSetsDense

def baireCategoryClosed (B : BaireCategoryPackage) : Prop :=
  B.completeMetrizable ∧ B.baireProperty ∧ B.countableIntersectionOfDenseOpenSetsDense

theorem baireCategory_closed_from_evidence (B : BaireCategoryPackage) (E : BaireCategoryEvidence B) : baireCategoryClosed B := by
  exact And.intro E.completeMetrizableClosed (And.intro E.bairePropertyClosed E.countableIntersectionOfDenseOpenSetsDenseClosed)

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse