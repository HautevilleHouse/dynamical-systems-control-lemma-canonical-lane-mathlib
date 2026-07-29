import DynamicalSystemsControlLemmaCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DynamicalSystemWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
