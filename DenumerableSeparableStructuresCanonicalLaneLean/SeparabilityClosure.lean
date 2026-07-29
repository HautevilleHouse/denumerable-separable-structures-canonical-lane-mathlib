import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure SeparabilityPackage where
  countableDenseSubset : Prop
  closureOfDenseEqualsWhole : Prop
  countableBase : Prop
  lindelofProperty : Prop

structure SeparabilityEvidence (S : SeparabilityPackage) where
  countableDenseSubsetClosed : S.countableDenseSubset
  closureOfDenseEqualsWholeClosed : S.closureOfDenseEqualsWhole
  countableBaseClosed : S.countableBase
  lindelofPropertyClosed : S.lindelofProperty

def SeparabilityClosed (S : SeparabilityPackage) : Prop :=
  S.countableDenseSubset ∧ S.closureOfDenseEqualsWhole ∧ S.countableBase ∧ S.lindelofProperty

theorem separability_closed_from_evidence (S : SeparabilityPackage) (E : SeparabilityEvidence S) :
    SeparabilityClosed S := by
  exact And.intro E.countableDenseSubsetClosed (And.intro E.closureOfDenseEqualsWholeClosed (And.intro E.countableBaseClosed E.lindelofPropertyClosed))

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse