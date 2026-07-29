import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure MembraneSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MembraneAdmittedObject where
  space : MembraneSpace
  lipidBilayerModel : Prop
  closureUnderElasticEnergy : Prop
  conclusion : closureUnderElasticEnergy

structure MembraneEndgameState where
  object : MembraneAdmittedObject

def MembraneWitnessClosed (O : MembraneAdmittedObject) : Prop :=
  O.closureUnderElasticEnergy

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse