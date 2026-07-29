import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure DynamicalSystemsControlAdmittedObject where
  stateSpace : Type
  dynamics : Type
  controlLaw : Type
  stabilityCondition : Prop
  conclusion : stabilityCondition

def DynamicalSystemsControlWitnessClosed (O : DynamicalSystemsControlAdmittedObject) : Prop :=
  O.stabilityCondition

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse