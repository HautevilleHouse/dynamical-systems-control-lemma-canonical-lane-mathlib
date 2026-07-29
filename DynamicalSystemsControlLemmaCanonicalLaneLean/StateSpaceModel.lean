import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure StateSpaceModel where
  stateType : Type u
  controlType : Type v
  dynamics : stateType → controlType → stateType
  equilibrium : stateType
  linearization : stateType → Matrix (Fin n) (Fin n) ℝ
  controllabilityMatrix : Matrix (Fin n) (Fin (n * m)) ℝ

def StateSpaceModelClosed (S : StateSpaceModel) : Prop :=
  S.linearization S.equilibrium = 0 ∧
  rank S.controllabilityMatrix = n

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse