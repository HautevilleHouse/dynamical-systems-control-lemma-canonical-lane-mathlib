import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

structure ControlSystemPackage where
  stateSpace : Type u
  controlSpace : Type v
  dynamics : stateSpace -> controlSpace -> stateSpace
  initialCondition : stateSpace
  timeDomain : Type w
  timeOrder : timeDomain -> timeDomain -> Prop
  timeDomainNonempty : Nonempty timeDomain
  trajectory : timeDomain -> stateSpace

def ControlSystemValid (C : ControlSystemPackage) : Prop :=
  Nonempty C.stateSpace ∧ Nonempty C.controlSpace

structure ControlSystemPackageEvidence (C : ControlSystemPackage) where
  stateSpaceNonempty : Nonempty C.stateSpace
  controlSpaceNonempty : Nonempty C.controlSpace

def ControlSystemPackageClosed (C : ControlSystemPackage) : Prop :=
  ControlSystemValid C

theorem control_system_package_closed_from_evidence
    (C : ControlSystemPackage) (E : ControlSystemPackageEvidence C) :
    ControlSystemPackageClosed C := by
  exact And.intro E.stateSpaceNonempty E.controlSpaceNonempty

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse