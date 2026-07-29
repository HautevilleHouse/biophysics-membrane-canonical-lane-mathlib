import BiophysicsMembraneCanonicalLaneLean.TransportPhenomena

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure SignalingPathwaysPackage {L : LipidBilayerPackage} {T : TransportPhenomenaPackage L} where
  receptorActivation : Prop
  secondMessenger : Prop
  signalAmplification : Prop
  signalTermination : Prop

structure SignalingPathwaysEvidence {L : LipidBilayerPackage} {T : TransportPhenomenaPackage L} (S : SignalingPathwaysPackage L T) where
  receptorActivationClosed : S.receptorActivation
  secondMessengerClosed : S.secondMessenger
  signalAmplificationClosed : S.signalAmplification
  signalTerminationClosed : S.signalTermination

def SignalingPathwaysClosed {L : LipidBilayerPackage} {T : TransportPhenomenaPackage L} (S : SignalingPathwaysPackage L T) : Prop :=
  S.receptorActivation ∧ S.secondMessenger ∧ S.signalAmplification ∧ S.signalTermination

theorem signaling_pathways_closed_from_evidence {L : LipidBilayerPackage} {T : TransportPhenomenaPackage L} (S : SignalingPathwaysPackage L T) (E : SignalingPathwaysEvidence S) :
    SignalingPathwaysClosed S := by
  exact And.intro E.receptorActivationClosed (And.intro E.secondMessengerClosed (And.intro E.signalAmplificationClosed E.signalTerminationClosed))

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse