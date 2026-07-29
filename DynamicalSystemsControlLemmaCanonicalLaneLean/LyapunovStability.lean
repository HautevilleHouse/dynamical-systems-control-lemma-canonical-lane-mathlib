import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure LyapunovStabilityPackage where
  lyapunovFunction : Type u → Type u
  lyapunovEquation : Prop
  exponentialStability : Prop
  asymptoticStability : Prop
  lyapunovEquationClosed : lyapunovEquation
  exponentialStabilityClosed : exponentialStability
  asymptoticStabilityClosed : asymptoticStability

structure LyapunovStabilityEvidence (L : LyapunovStabilityPackage) where
  lyapunovEquationClosed : L.lyapunovEquation
  exponentialStabilityClosed : L.exponentialStability
  asymptoticStabilityClosed : L.asymptoticStability

def LyapunovStabilityClosed (L : LyapunovStabilityPackage) : Prop :=
  L.lyapunovEquation ∧ L.exponentialStability ∧ L.asymptoticStability

theorem lyapunov_stability_closed_from_evidence (L : LyapunovStabilityPackage) (E : LyapunovStabilityEvidence L) : LyapunovStabilityClosed L := by
  exact And.intro E.lyapunovEquationClosed (And.intro E.exponentialStabilityClosed E.asymptoticStabilityClosed)

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse