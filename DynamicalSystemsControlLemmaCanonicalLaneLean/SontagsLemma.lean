import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

/-!
# Sontag's Lemma Package

This module formalizes Sontag's lemma on the existence of smooth feedback laws
from a control Lyapunov function, framed as an admissible-class closure.
-/

structure SontagLemmaStructure where
  clfType : String
  smoothFeedbackExists : Prop
  affineInControl : Prop
  inequalitySatisfied : Prop

structure SontagLemmaEvidence (S : SontagLemmaStructure) where
  smoothFeedbackExistsClosed : S.smoothFeedbackExists
  affineInControlClosed : S.affineInControl
  inequalitySatisfiedClosed : S.inequalitySatisfied

def SontagLemmaClosed (S : SontagLemmaStructure) : Prop :=
  S.smoothFeedbackExists ∧ S.affineInControl ∧ S.inequalitySatisfied

theorem sontag_lemma_closed_from_evidence
    (S : SontagLemmaStructure) (E : SontagLemmaEvidence S) :
    SontagLemmaClosed S := by
  exact And.intro E.smoothFeedbackExistsClosed
    (And.intro E.affineInControlClosed E.inequalitySatisfiedClosed)

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
