import DynamicalSystemsControlLemmaCanonicalLaneLean.StabilizationTheorem

/-!
# Optimal Control Lemma Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure OptimalControlLemmaPackage {S : StateSpaceDynamicsPackage}
    {L : ControlLyapunovPackage S} (T : StabilizationTheoremPackage L) where
  costFunctional : (S.stateManifold → S.controlInput) → Type u
  hjbEquation : Prop
  valueFunction : S.stateManifold → Type v
  optimalFeedback : S.stateManifold → S.controlInput
  optimalCost : Prop

def OptimalControlLemmaClosed {S : StateSpaceDynamicsPackage}
    {L : ControlLyapunovPackage S} {T : StabilizationTheoremPackage L}
    (O : OptimalControlLemmaPackage T) : Prop :=
  O.hjbEquation ∧ O.optimalCost

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
