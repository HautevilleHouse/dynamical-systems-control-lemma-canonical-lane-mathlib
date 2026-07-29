import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

/-!
# Barrier Certificate Package

This module formalizes barrier certificates for safety verification of control
systems as an admissible-class bridge.
-/

structure BarrierCertificateStructure where
  stateSpace : Type u
  safeSet : stateSpace → Prop
  barrierFunction : stateSpace → ℝ
  initialCondition : Prop
  dissipationInequality : Prop
  unsafeRegionAvoided : Prop

structure BarrierCertificateEvidence (B : BarrierCertificateStructure) where
  initialConditionClosed : B.initialCondition
  dissipationInequalityClosed : B.dissipationInequality
  unsafeRegionAvoidedClosed : B.unsafeRegionAvoided

def BarrierCertificateClosed (B : BarrierCertificateStructure) : Prop :=
  B.initialCondition ∧ B.dissipationInequality ∧ B.unsafeRegionAvoided

theorem barrier_certificate_closed_from_evidence
    (B : BarrierCertificateStructure) (E : BarrierCertificateEvidence B) :
    BarrierCertificateClosed B := by
  exact And.intro E.initialConditionClosed
    (And.intro E.dissipationInequalityClosed E.unsafeRegionAvoidedClosed)

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
