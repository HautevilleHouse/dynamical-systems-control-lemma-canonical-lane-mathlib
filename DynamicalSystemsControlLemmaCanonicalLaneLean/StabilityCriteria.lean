import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsControlLemmaCanonicalLaneLean.ControlSystemPackage

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure StabilityCriteriaPackage (C : ControlSystemPackage) where
  equilibriumPoint : C.stateSpace
  lyapunovFunction : C.stateSpace -> ℝ
  lyapunovPositivity : ∀ x ≠ C.initialCondition, lyapunovFunction x > 0
  derivativeNegative : C.dynamics C.initialCondition (someControl : C.controlSpace) → lyapunovFunction (C.dynamics C.initialCondition someControl) < lyapunovFunction C.initialCondition
  someControl : C.controlSpace
  lyapunovPositivityClosed : lyapunovPositivity
  derivativeNegativeClosed : derivativeNegative

def StabilityCriteriaValid {C : ControlSystemPackage} (S : StabilityCriteriaPackage C) : Prop :=
  S.lyapunovPositivity ∧ S.derivativeNegative

structure StabilityCriteriaEvidence {C : ControlSystemPackage} (S : StabilityCriteriaPackage C) where
  lyapunovPositivityClosed : S.lyapunovPositivity
  derivativeNegativeClosed : S.derivativeNegative

def StabilityCriteriaClosed {C : ControlSystemPackage} (S : StabilityCriteriaPackage C) : Prop :=
  StabilityCriteriaValid S

theorem stability_criteria_closed_from_evidence
    {C : ControlSystemPackage} (S : StabilityCriteriaPackage C)
    (E : StabilityCriteriaEvidence S) : StabilityCriteriaClosed S := by
  exact And.intro E.lyapunovPositivityClosed E.derivativeNegativeClosed

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse