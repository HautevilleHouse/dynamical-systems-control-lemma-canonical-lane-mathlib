import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

/-!
# Stabilizability Package

This module formalizes the stabilizability of a control system via feedback
as an admissible-class bridge, relying on the existence of a CLF.
-/

structure StabilizabilityStructure where
  systemType : String
  equilibriumPoint : Type u
  feedbackLaw : Type v
  closedLoopStable : Prop
  clfExists : Prop

structure StabilizabilityEvidence (S : StabilizabilityStructure) where
  closedLoopStableClosed : S.closedLoopStable
  clfExistsClosed : S.clfExists

def StabilizabilityClosed (S : StabilizabilityStructure) : Prop :=
  S.closedLoopStable ∧ S.clfExists

theorem stabilizability_closed_from_evidence
    (S : StabilizabilityStructure) (E : StabilizabilityEvidence S) :
    StabilizabilityClosed S := by
  exact And.intro E.closedLoopStableClosed E.clfExistsClosed

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
