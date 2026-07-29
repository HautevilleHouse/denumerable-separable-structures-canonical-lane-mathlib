import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure DenumerableSeparablePackage where
  carrierSet : Type u
  countableDenseSubset : carrierSet → Prop
  topology : TopologicalSpace carrierSet
  separable : ∃ (D : Set carrierSet), Set.Countable D ∧ Dense D
  denumerable : Set.Countable (Set.univ : Set carrierSet)

def separableClosed (P : DenumerableSeparablePackage) : Prop :=
  P.separable

def denumerableClosed (P : DenumerableSeparablePackage) : Prop :=
  P.denumerable

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse