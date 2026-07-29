import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DenumSepWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse