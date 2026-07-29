import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DenumerableSeparableStructuresCanonicalLaneLean.LusinSeparation

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

def ConstrainedDescriptiveSetTheoryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_descriptive_set_theory_endgame (A : AdmissibleClass) :
    ConstrainedDescriptiveSetTheoryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse