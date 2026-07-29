import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.MembraneFluidMosaicModel

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure ChannelTransportPackage {L : LipidPacking} {E : MembraneElasticity}
    (F : FluidMosaicPackage L E) where
  ionSelectivity : Prop
  gatingMechanism : Prop
  transportKinetics : Prop
  electroChemicalGradient : Prop

structure ChannelTransportEvidence {L : LipidPacking} {E : MembraneElasticity}
    {F : FluidMosaicPackage L E} (C : ChannelTransportPackage F) where
  ionSelectivityClosed : C.ionSelectivity
  gatingMechanismClosed : C.gatingMechanism
  transportKineticsClosed : C.transportKinetics
  electroChemicalGradientClosed : C.electroChemicalGradient

def ChannelTransportClosed {L : LipidPacking} {E : MembraneElasticity}
    {F : FluidMosaicPackage L E} (C : ChannelTransportPackage F) : Prop :=
  C.ionSelectivity ∧ C.gatingMechanism ∧ C.transportKinetics ∧ C.electroChemicalGradient

theorem channel_transport_closed_from_evidence {L : LipidPacking} {E : MembraneElasticity}
    {F : FluidMosaicPackage L E} (C : ChannelTransportPackage F)
    (ev : ChannelTransportEvidence C) : ChannelTransportClosed C := by
  exact And.intro ev.ionSelectivityClosed
    (And.intro ev.gatingMechanismClosed
      (And.intro ev.transportKineticsClosed ev.electroChemicalGradientClosed))

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse