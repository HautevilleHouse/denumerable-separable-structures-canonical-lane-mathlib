import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure StoneWeierstrassPackage where
  space : DenumerableSeparablePackage
  algebra : Set (space.carrierSet → ℝ)
  containsConstants : (fun _ : space.carrierSet => (1 : ℝ)) ∈ algebra
  separatesPoints : ∀ x y : space.carrierSet, x ≠ y → ∃ f ∈ algebra, f x ≠ f y
  closedUnderUniformLimit : Prop

def stoneWeierstrassClosed (S : StoneWeierstrassPackage) : Prop :=
  S.containsConstants ∧ S.separatesPoints ∧ S.closedUnderUniformLimit

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse