import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure MembraneAdmittedObject where
  lipidBilayer : Type
  membranePotential : Prop
  ionicCurrents : Prop
  receptorBinding : Prop
  conclusion : receptorBinding

structure AdmissibleClass where
  object : MembraneAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MembraneWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse
