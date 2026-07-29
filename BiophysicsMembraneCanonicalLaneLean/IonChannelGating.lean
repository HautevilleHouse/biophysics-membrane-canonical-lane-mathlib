import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.LipidBilayerElasticity

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure IonChannelGatingPackage {C : MembraneCompositionPackage}
    (E : LipidBilayerElasticityPackage C) where
  channelState : Type u
  openProbability : Type v
  gatingEnergy : Type w
  voltageDependence : Prop
  ligandBinding : Prop
  stateTransitionRates : Prop

structure IonChannelGatingEvidence {C : MembraneCompositionPackage}
    {E : LipidBilayerElasticityPackage C} (G : IonChannelGatingPackage E) where
  voltageDependenceClosed : G.voltageDependence
  ligandBindingClosed : G.ligandBinding
  stateTransitionRatesClosed : G.stateTransitionRates

def IonChannelGatingClosed {C : MembraneCompositionPackage}
    {E : LipidBilayerElasticityPackage C} (G : IonChannelGatingPackage E) : Prop :=
  G.voltageDependence ∧ G.ligandBinding ∧ G.stateTransitionRates

theorem ion_channel_gating_closed_from_evidence
    {C : MembraneCompositionPackage} {E : LipidBilayerElasticityPackage C}
    (G : IonChannelGatingPackage E) (Ev : IonChannelGatingEvidence G) :
    IonChannelGatingClosed G := by
  exact And.intro Ev.voltageDependenceClosed
    (And.intro Ev.ligandBindingClosed Ev.stateTransitionRatesClosed)

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse