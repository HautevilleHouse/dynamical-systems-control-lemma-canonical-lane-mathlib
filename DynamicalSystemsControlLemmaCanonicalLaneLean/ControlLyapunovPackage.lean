import DynamicalSystemsControlLemmaCanonicalLaneLean.StateSpaceDynamics

/-!
# Control Lyapunov Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure ControlLyapunovPackage {S : StateSpaceDynamicsPackage} where
  lyapunovFunction : S.stateManifold → Type u
  positiveDefinite : Prop
  proper : Prop
  controlLyapunovInequality : S.stateManifold → S.controlInput → Prop
  lyapunovStabilizationCondition : Prop

def ControlLyapunovClosed {S : StateSpaceDynamicsPackage} (L : ControlLyapunovPackage S) : Prop :=
  L.positiveDefinite ∧ L.proper ∧ L.lyapunovStabilizationCondition

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
