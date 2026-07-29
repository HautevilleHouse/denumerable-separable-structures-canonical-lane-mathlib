import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure DenumSepSpace where
  carrier : Type
  countable : Prop
  separable : Prop
  topology : TopologicalSpace carrier

structure DenumSepAdmittedObject where
  space : DenumSepSpace
  countable : Prop
  separable : Prop
  model : Type
  modelTopology : TopologicalSpace model
  isomorphicToModel : Prop
  conclusion : isomorphicToModel

structure DenumSepEndgameState where
  object : DenumSepAdmittedObject

def DenumSepWitnessClosed (O : DenumSepAdmittedObject) : Prop :=
  O.isomorphicToModel

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse