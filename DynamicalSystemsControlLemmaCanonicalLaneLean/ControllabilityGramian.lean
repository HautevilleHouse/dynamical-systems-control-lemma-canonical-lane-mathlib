import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure ControllabilityGramianPackage where
  gramianMatrix : Type u → Type u
  positiveDefinite : Prop
  controllabilityRank : Prop
  feedbackStabilizability : Prop
  positiveDefiniteClosed : positiveDefinite
  controllabilityRankClosed : controllabilityRank
  feedbackStabilizabilityClosed : feedbackStabilizability

structure ControllabilityGramianEvidence (G : ControllabilityGramianPackage) where
  positiveDefiniteClosed : G.positiveDefinite
  controllabilityRankClosed : G.controllabilityRank
  feedbackStabilizabilityClosed : G.feedbackStabilizability

def ControllabilityGramianClosed (G : ControllabilityGramianPackage) : Prop :=
  G.positiveDefinite ∧ G.controllabilityRank ∧ G.feedbackStabilizability

theorem controllability_gramian_closed_from_evidence (G : ControllabilityGramianPackage) (E : ControllabilityGramianEvidence G) : ControllabilityGramianClosed G := by
  exact And.intro E.positiveDefiniteClosed (And.intro E.controllabilityRankClosed E.feedbackStabilizabilityClosed)

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse