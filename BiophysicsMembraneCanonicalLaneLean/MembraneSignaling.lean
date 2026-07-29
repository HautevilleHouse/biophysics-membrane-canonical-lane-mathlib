import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.MembraneChannelTransport

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure SignalingPackage {L : LipidPacking} {E : MembraneElasticity}
    {F : FluidMosaicPackage L E} {C : ChannelTransportPackage F} where
  receptorBinding : Prop
  secondMessengerCascade : Prop
  signalAmplification : Prop
  responseTermination : Prop

structure SignalingEvidence {L : LipidPacking} {E : MembraneElasticity}
    {F : FluidMosaicPackage L E} {C : ChannelTransportPackage F}
    (S : SignalingPackage C) where
  receptorBindingClosed : S.receptorBinding
  secondMessengerCascadeClosed : S.secondMessengerCascade
  signalAmplificationClosed : S.signalAmplification
  responseTerminationClosed : S.responseTermination

def SignalingClosed {L : LipidPacking} {E : MembraneElasticity}
    {F : FluidMosaicPackage L E} {C : ChannelTransportPackage F}
    (S : SignalingPackage C) : Prop :=
  S.receptorBinding ∧ S.secondMessengerCascade ∧ S.signalAmplification ∧ S.responseTermination

theorem signaling_closed_from_evidence {L : LipidPacking} {E : MembraneElasticity}
    {F : FluidMosaicPackage L E} {C : ChannelTransportPackage F}
    (S : SignalingPackage C) (ev : SignalingEvidence S) : SignalingClosed S := by
  exact And.intro ev.receptorBindingClosed
    (And.intro ev.secondMessengerCascadeClosed
      (And.intro ev.signalAmplificationClosed ev.responseTerminationClosed))

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse