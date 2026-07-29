import DynamicalSystemsControlLemmaCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
