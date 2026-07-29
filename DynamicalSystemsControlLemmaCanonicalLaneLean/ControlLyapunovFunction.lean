import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

/-!
# Control Lyapunov Function (CLF) Package

This module formalizes the existence of a control Lyapunov function as an
admissible-class bridge in the Dynamical Systems Control Lemma.
-/

structure ControlLyapunovFunctionStructure where
  stateSpace : Type u
  controlSet : Type v
  dynamics : stateSpace × controlSet → stateSpace
  lyapunovFunction : stateSpace → ℝ
  positiveDefinite : Prop
  decrescent : Prop
  controlInequality : Prop

structure ControlLyapunovFunctionEvidence (C : ControlLyapunovFunctionStructure) where
  positiveDefiniteClosed : C.positiveDefinite
  decrescentClosed : C.decrescent
  controlInequalityClosed : C.controlInequality

def ControlLyapunovFunctionClosed (C : ControlLyapunovFunctionStructure) : Prop :=
  C.positiveDefinite ∧ C.decrescent ∧ C.controlInequality

theorem control_lyapunov_function_closed_from_evidence
    (C : ControlLyapunovFunctionStructure) (E : ControlLyapunovFunctionEvidence C) :
    ControlLyapunovFunctionClosed C := by
  exact And.intro E.positiveDefiniteClosed
    (And.intro E.decrescentClosed E.controlInequalityClosed)

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
