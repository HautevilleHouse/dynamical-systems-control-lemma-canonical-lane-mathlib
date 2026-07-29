import DynamicalSystemsControlLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicalSystemsControlLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DynamicalSystemSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DynamicalSystemAdmittedObject where
  space : DynamicalSystemSpace
  controlSystemDefined : Prop
  stateSpaceManifold : Prop
  controlInputSpace : Type
  controlTopology : TopologicalSpace controlInputSpace
  stabilizationCondition : Prop
  conclusion : stabilizationCondition

structure DynamicalEndgameState where
  object : DynamicalSystemAdmittedObject

def DynamicalSystemWitnessClosed (O : DynamicalSystemAdmittedObject) : Prop :=
  O.stabilizationCondition

end DynamicalSystemsControlLemmaCanonicalLaneLean
end HautevilleHouse
