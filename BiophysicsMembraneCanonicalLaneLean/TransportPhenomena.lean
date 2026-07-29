import BiophysicsMembraneCanonicalLaneLean.LipidBilayer

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure TransportPhenomenaPackage {L : LipidBilayerPackage} where
  passiveDiffusion : Prop
  facilitatedDiffusion : Prop
  activeTransport : Prop
  ionChannelGating : Prop

structure TransportPhenomenaEvidence {L : LipidBilayerPackage} (T : TransportPhenomenaPackage L) where
  passiveDiffusionClosed : T.passiveDiffusion
  facilitatedDiffusionClosed : T.facilitatedDiffusion
  activeTransportClosed : T.activeTransport
  ionChannelGatingClosed : T.ionChannelGating

def TransportPhenomenaClosed {L : LipidBilayerPackage} (T : TransportPhenomenaPackage L) : Prop :=
  T.passiveDiffusion ∧ T.facilitatedDiffusion ∧ T.activeTransport ∧ T.ionChannelGating

theorem transport_phenomena_closed_from_evidence {L : LipidBilayerPackage} (T : TransportPhenomenaPackage L) (E : TransportPhenomenaEvidence T) :
    TransportPhenomenaClosed T := by
  exact And.intro E.passiveDiffusionClosed (And.intro E.facilitatedDiffusionClosed (And.intro E.activeTransportClosed E.ionChannelGatingClosed))

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse