import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure LyapunovFunction (X : Type) where
  V : X → ℝ
  positiveDefinite : ∀ x ≠ x₀, V x > 0
  decreasingAlongTrajectories : ∀ x, V (f x) ≤ V x
  equilibriumPoint : X
  equilibriumPointProperty : f equilibriumPoint = equilibriumPoint
  f : X → X
  x₀ : X := equilibriumPoint

def LyapunovClosed {X : Type} (L : LyapunovFunction X) : Prop :=
  L.positiveDefinite ∧ L.decreasingAlongTrajectories

theorem lyapunov_closed_from_evidence {X : Type} (L : LyapunovFunction X) : LyapunovClosed L :=
  And.intro L.positiveDefinite L.decreasingAlongTrajectories

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
