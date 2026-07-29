import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure StabilizableSystem where
  stateSpace : Type
  controlSpace : Type
  dynamics : stateSpace × controlSpace → stateSpace
  feedback : stateSpace → controlSpace
  closedLoopDynamics : stateSpace → stateSpace := λ x => dynamics (x, feedback x)
  equilibriumPoint : stateSpace
  fixedPointProperty : closedLoopDynamics equilibriumPoint = equilibriumPoint
  stabilizable : Prop

def StabilizableClosed (S : StabilizableSystem) : Prop :=
  S.stabilizable ∧ S.fixedPointProperty

theorem stabilizable_closed_from_evidence (S : StabilizableSystem) : StabilizableClosed S :=
  And.intro S.stabilizable S.fixedPointProperty

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
