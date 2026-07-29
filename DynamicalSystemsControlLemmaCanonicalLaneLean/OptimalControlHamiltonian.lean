import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsControlLemmaCanonicalLaneLean.ControlSystemPackage

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure OptimalControlHamiltonianPackage (C : ControlSystemPackage) where
  costFunction : C.stateSpace -> C.controlSpace -> ℝ
  hamiltonian : C.stateSpace -> C.controlSpace -> ℝ := λ x u => costFunction x u
  necessaryCondition : ∀ (x : C.stateSpace) (u : C.controlSpace), hamiltonian x u ≥ 0
  adjointDynamics : C.stateSpace -> ℝ
  adjointEquation : adjointDynamics = λ x => - (∂ (hamiltonian x) / ∂ x)
  necessaryConditionClosed : necessaryCondition
  adjointEquationClosed : adjointEquation

def OptimalControlHamiltonianValid {C : ControlSystemPackage} (H : OptimalControlHamiltonianPackage C) : Prop :=
  H.necessaryCondition ∧ H.adjointEquation

structure OptimalControlHamiltonianEvidence {C : ControlSystemPackage} (H : OptimalControlHamiltonianPackage C) where
  necessaryConditionClosed : H.necessaryCondition
  adjointEquationClosed : H.adjointEquation

def OptimalControlHamiltonianClosed {C : ControlSystemPackage} (H : OptimalControlHamiltonianPackage C) : Prop :=
  OptimalControlHamiltonianValid H

theorem optimal_control_hamiltonian_closed_from_evidence
    {C : ControlSystemPackage} (H : OptimalControlHamiltonianPackage C)
    (E : OptimalControlHamiltonianEvidence H) : OptimalControlHamiltonianClosed H := by
  exact And.intro E.necessaryConditionClosed E.adjointEquationClosed

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse