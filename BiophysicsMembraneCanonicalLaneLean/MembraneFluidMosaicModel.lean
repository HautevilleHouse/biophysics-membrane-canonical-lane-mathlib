import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.MembranePhysics

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure FluidMosaicPackage (L : LipidPacking) (E : MembraneElasticity) where
  lateralDiffusion : Prop
  lipidRaftFormation : Prop
  proteinMobility : Prop

structure FluidMosaicEvidence {L : LipidPacking} {E : MembraneElasticity}
    (F : FluidMosaicPackage L E) where
  lateralDiffusionClosed : F.lateralDiffusion
  lipidRaftFormationClosed : F.lipidRaftFormation
  proteinMobilityClosed : F.proteinMobility

def FluidMosaicClosed {L : LipidPacking} {E : MembraneElasticity}
    (F : FluidMosaicPackage L E) : Prop :=
  F.lateralDiffusion ∧ F.lipidRaftFormation ∧ F.proteinMobility

theorem fluid_mosaic_closed_from_evidence {L : LipidPacking} {E : MembraneElasticity}
    (F : FluidMosaicPackage L E) (ev : FluidMosaicEvidence F) :
    FluidMosaicClosed F := by
  exact And.intro ev.lateralDiffusionClosed
    (And.intro ev.lipidRaftFormationClosed ev.proteinMobilityClosed)

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse