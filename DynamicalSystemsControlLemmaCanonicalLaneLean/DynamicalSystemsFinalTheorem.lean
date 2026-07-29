import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsControlLemmaCanonicalLaneLean.ControlSystemPackage
import HautevilleHouse.DynamicalSystemsControlLemmaCanonicalLaneLean.StabilityCriteria
import HautevilleHouse.DynamicalSystemsControlLemmaCanonicalLaneLean.ControllabilityGramian
import HautevilleHouse.DynamicalSystemsControlLemmaCanonicalLaneLean.OptimalControlHamiltonian
import HautevilleHouse.DynamicalSystemsControlLemmaCanonicalLaneLean.FeedbackStabilization

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ControlSystemPackageClosed (A.object.space)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.space.spaceNonempty

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedDynamicalSystemsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamical_systems_endgame (A : AdmissibleClass) : ConstrainedDynamicalSystemsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse