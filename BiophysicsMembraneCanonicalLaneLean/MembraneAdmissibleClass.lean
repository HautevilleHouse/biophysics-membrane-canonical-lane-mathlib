import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.MembraneMathlibObjects

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure AdmissibleClass where
  object : MembraneAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MembraneWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse