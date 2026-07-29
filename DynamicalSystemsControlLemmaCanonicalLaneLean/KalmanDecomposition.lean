import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsControlLemmaCanonicalLaneLean.StateSpaceModel
import HautevilleHouse.DynamicalSystemsControlLemmaCanonicalLaneLean.ControllabilityGramian

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure KalmanDecomposition (S : StateSpaceModel) where
  controllableSubspace : Submodule ℝ (S.stateType)
  uncontrollableSubspace : Submodule ℝ (S.stateType)
  directSum : IsInternal (fun i : Fin 2 => match i with | 0 => controllableSubspace | 1 => uncontrollableSubspace)
  invariantUnderDynamics : ∀ x ∈ controllableSubspace, S.dynamics x 0 ∈ controllableSubspace

def KalmanDecompositionClosed (K : KalmanDecomposition S) : Prop :=
  K.directSum ∧ K.invariantUnderDynamics

theorem kalman_decomposition_closed_from_evidence (K : KalmanDecomposition S) (hds : K.directSum) (hiv : K.invariantUnderDynamics) :
    KalmanDecompositionClosed K := by
  exact And.intro hds hiv

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse