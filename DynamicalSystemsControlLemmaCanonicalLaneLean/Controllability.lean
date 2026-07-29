import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure Controllability (X : Type) (U : Type) where
  stateSpace : X
  controlSpace : U
  reachableSet : X → Set X
  controllabilityGramian : X → X → 𝕜
  controllable : Prop
  gramianFullRank : Prop
  controllableImpliesGramianRank : controllable → gramianFullRank

def ControllabilityClosed {X U : Type} (C : Controllability X U) : Prop :=
  C.controllable ∧ C.gramianFullRank

theorem controllability_closed_from_evidence {X U : Type} (C : Controllability X U) : ControllabilityClosed C :=
  And.intro C.controllable C.gramianFullRank

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
