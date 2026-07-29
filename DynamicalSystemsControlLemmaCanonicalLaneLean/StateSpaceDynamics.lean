import DynamicalSystemsControlLemmaCanonicalLaneLean.RiemannianCurvature

/-!
# State Space Dynamics Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure StateSpaceDynamicsPackage where
  stateManifold : Type u
  stateTopology : TopologicalSpace stateManifold
  vectorField : stateManifold → Type v
  smoothVectorField : Prop
  flowExists : Prop
  controlInput : Type w
  controlMap : stateManifold → controlInput → vectorField stateManifold
  driftTerm : vectorField stateManifold
  controlAffine : Prop

def StateSpaceDynamicsClosed (S : StateSpaceDynamicsPackage) : Prop :=
  S.smoothVectorField ∧ S.flowExists ∧ S.controlAffine

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
