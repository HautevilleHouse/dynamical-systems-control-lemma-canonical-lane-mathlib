import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsControlLemmaCanonicalLaneLean.ControlLyapunovFunction
import DynamicalSystemsControlLemmaCanonicalLaneLean.Stabilizability
import DynamicalSystemsControlLemmaCanonicalLaneLean.SontagsLemma
import DynamicalSystemsControlLemmaCanonicalLaneLean.BarrierCertificate

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

/-!
# Final Theorem: Dynamical Systems Control Lemma Closure

This module assembles the constrained closure for the Dynamical Systems
Control Lemma.
-/

def ConstrainedDynamicalControlClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamical_control_endgame (A : AdmissibleClass) :
    ConstrainedDynamicalControlClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
