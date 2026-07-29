import DynamicalSystemsControlLemmaCanonicalLaneLean.ControlLyapunovPackage

/-!
# Stabilization Theorem Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure StabilizationTheoremPackage {S : StateSpaceDynamicsPackage}
    (L : ControlLyapunovPackage S) where
  feedbackLaw : S.stateManifold → S.controlInput
  closedLoopStable : Prop
  regionOfAttraction : Set S.stateManifold
  almostGlobalStabilization : Prop

def StabilizationTheoremClosed {S : StateSpaceDynamicsPackage}
    {L : ControlLyapunovPackage S} (T : StabilizationTheoremPackage L) : Prop :=
  T.closedLoopStable ∧ T.almostGlobalStabilization

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
