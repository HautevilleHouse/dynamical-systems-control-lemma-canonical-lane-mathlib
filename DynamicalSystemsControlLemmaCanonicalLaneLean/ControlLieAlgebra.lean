import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure ControlLieAlgebraPackage where
  lieBracket : Type u → Type u → Type u
  jacobiIdentity : Prop
  advectiveFlow : Prop
  controllabilityGramian : Prop
  jacobiIdentityClosed : jacobiIdentity
  advectiveFlowClosed : advectiveFlow
  controllabilityGramianClosed : controllabilityGramian

structure ControlLieAlgebraEvidence (L : ControlLieAlgebraPackage) where
  jacobiIdentityClosed : L.jacobiIdentity
  advectiveFlowClosed : L.advectiveFlow
  controllabilityGramianClosed : L.controllabilityGramian

def ControlLieAlgebraClosed (L : ControlLieAlgebraPackage) : Prop :=
  L.jacobiIdentity ∧ L.advectiveFlow ∧ L.controllabilityGramian

theorem control_lie_algebra_closed_from_evidence (L : ControlLieAlgebraPackage) (E : ControlLieAlgebraEvidence L) : ControlLieAlgebraClosed L := by
  exact And.intro E.jacobiIdentityClosed (And.intro E.advectiveFlowClosed E.controllabilityGramianClosed)

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse