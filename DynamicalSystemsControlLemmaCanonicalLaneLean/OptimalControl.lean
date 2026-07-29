import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure OptimalControlPackage where
  costFunctional : Type u → Type u
  hjbEquation : Prop
  pontryaginMaximum : Prop
  valueFunctionSmooth : Prop
  hjbEquationClosed : hjbEquation
  pontryaginMaximumClosed : pontryaginMaximum
  valueFunctionSmoothClosed : valueFunctionSmooth

structure OptimalControlEvidence (O : OptimalControlPackage) where
  hjbEquationClosed : O.hjbEquation
  pontryaginMaximumClosed : O.pontryaginMaximum
  valueFunctionSmoothClosed : O.valueFunctionSmooth

def OptimalControlClosed (O : OptimalControlPackage) : Prop :=
  O.hjbEquation ∧ O.pontryaginMaximum ∧ O.valueFunctionSmooth

theorem optimal_control_closed_from_evidence (O : OptimalControlPackage) (E : OptimalControlEvidence O) : OptimalControlClosed O := by
  exact And.intro E.hjbEquationClosed (And.intro E.pontryaginMaximumClosed E.valueFunctionSmoothClosed)

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse