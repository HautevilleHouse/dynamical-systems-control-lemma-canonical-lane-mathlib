import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure Observability (X : Type) (Y : Type) where
  stateSpace : X
  outputSpace : Y
  outputMap : X → Y
  observabilityGramian : X → X → 𝕜
  observable : Prop
  gramianFullRank : Prop
  observableImpliesGramianRank : observable → gramianFullRank

def ObservabilityClosed {X Y : Type} (O : Observability X Y) : Prop :=
  O.observable ∧ O.gramianFullRank

theorem observability_closed_from_evidence {X Y : Type} (O : Observability X Y) : ObservabilityClosed O :=
  And.intro O.observable O.gramianFullRank

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
