import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsControlLemmaCanonicalLaneLean.StateSpaceModel

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure OptimalControlProblem (S : StateSpaceModel) where
  costFunctional : (S.stateType → S.controlType → ℝ) → ℝ
  admissibilityCondition : (S.stateType → S.controlType → ℝ) → Prop
  hamiltonian : (S.stateType × S.controlType × ℝ) → ℝ

structure PontryaginMaximumPrincipleResult (S : StateSpaceModel) (P : OptimalControlProblem S) where
  optimalControl : S.controlType
  costateEquation : S.stateType → ℝ
  maximizationCondition : ∀ (u : S.controlType), P.hamiltonian (S.equilibrium, optimalControl, costateEquation S.equilibrium) ≥ P.hamiltonian (S.equilibrium, u, costateEquation S.equilibrium)
  boundaryCondition : costateEquation S.equilibrium = 0

def PontryaginMaximumPrincipleClosed (S : StateSpaceModel) (P : OptimalControlProblem S) (R : PontryaginMaximumPrincipleResult S P) : Prop :=
  R.maximizationCondition ∧ R.boundaryCondition

theorem pontryagin_maximum_principle_closed (S : StateSpaceModel) (P : OptimalControlProblem S) (R : PontryaginMaximumPrincipleResult S P) (hmax : R.maximizationCondition) (hbound : R.boundaryCondition) :
    PontryaginMaximumPrincipleClosed S P R := by
  exact And.intro hmax hbound

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse