import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsControlLemmaCanonicalLaneLean.StateSpaceModel

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure LyapunovFunction (S : StateSpaceModel) where
  V : S.stateType → ℝ
  positiveDefinite : V S.equilibrium = 0 ∧ ∀ x ≠ S.equilibrium, V x > 0
  derivativeNonpositive : ∀ (x : S.stateType) (u : S.controlType), V (S.dynamics x u) ≤ V x

noncomputable def LyapunovStabilityClosed (S : StateSpaceModel) (L : LyapunovFunction S) : Prop :=
  L.positiveDefinite.1 ∧ L.positiveDefinite.2 ∧ L.derivativeNonpositive

theorem lyapunov_stability_from_evidence (S : StateSpaceModel) (L : LyapunovFunction S) (h1 : L.positiveDefinite.1) (h2 : L.positiveDefinite.2) (h3 : L.derivativeNonpositive) :
    LyapunovStabilityClosed S L := by
  exact And.intro h1 (And.intro h2 h3)

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse