import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure ControlSystemState where
  stateSpace : Type u
  inputSpace : Type v
  outputSpace : Type w
  stateDynamics : stateSpace → inputSpace → stateSpace
  outputMap : stateSpace → outputSpace
  smoothManifold : Prop
  controlLieAlgebra : Prop
  smoothDynamicsTerm : smoothManifold
  controlLieAlgebraTerm : controlLieAlgebra

structure ControlSystemEvidence (X : ControlSystemState) where
  smoothManifoldClosed : X.smoothManifold
  controlLieAlgebraClosed : X.controlLieAlgebra

def ControlSystemClosed (X : ControlSystemState) : Prop :=
  X.smoothManifold ∧ X.controlLieAlgebra

theorem control_system_closed_from_evidence (X : ControlSystemState) (E : ControlSystemEvidence X) : ControlSystemClosed X := by
  exact And.intro E.smoothManifoldClosed E.controlLieAlgebraClosed

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse