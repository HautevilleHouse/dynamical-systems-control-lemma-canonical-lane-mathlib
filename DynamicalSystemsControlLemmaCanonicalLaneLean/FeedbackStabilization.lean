import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsControlLemmaCanonicalLaneLean.ControlSystemPackage

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure FeedbackStabilizationPackage (C : ControlSystemPackage) where
  feedbackLaw : C.stateSpace -> C.controlSpace
  closedLoopDynamics : C.stateSpace -> C.stateSpace := λ x => C.dynamics x (feedbackLaw x)
  stabilityCondition : ∃ V : C.stateSpace → ℝ, (V C.initialCondition = 0 ∧ (∀ x ≠ C.initialCondition, V x > 0) ∧ (∀ x, V (closedLoopDynamics x) < V x))
  stabilityConditionClosed : stabilityCondition

def FeedbackStabilizationValid {C : ControlSystemPackage} (F : FeedbackStabilizationPackage C) : Prop :=
  F.stabilityCondition

structure FeedbackStabilizationEvidence {C : ControlSystemPackage} (F : FeedbackStabilizationPackage C) where
  stabilityConditionClosed : F.stabilityCondition

def FeedbackStabilizationClosed {C : ControlSystemPackage} (F : FeedbackStabilizationPackage C) : Prop :=
  FeedbackStabilizationValid F

theorem feedback_stabilization_closed_from_evidence
    {C : ControlSystemPackage} (F : FeedbackStabilizationPackage C)
    (E : FeedbackStabilizationEvidence F) : FeedbackStabilizationClosed F := by
  exact E.stabilityConditionClosed

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse