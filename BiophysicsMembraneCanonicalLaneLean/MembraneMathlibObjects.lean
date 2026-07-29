import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.MembraneTheoremStatement

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure MembraneSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MembraneAdmittedObject where
  space : MembraneSpace
  fluidMosaic : Prop
  selectivePermeability : Prop
  receptorDensity : Prop
  conclusion : fluidMosaic ∧ selectivePermeability ∧ receptorDensity

structure MembraneEndgameState where
  object : MembraneAdmittedObject

def MembraneWitnessClosed (O : MembraneAdmittedObject) : Prop :=
  O.fluidMosaic ∧ O.selectivePermeability ∧ O.receptorDensity

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse