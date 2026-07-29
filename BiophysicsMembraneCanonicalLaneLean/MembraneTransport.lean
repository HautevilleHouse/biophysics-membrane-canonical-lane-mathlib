import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.MembraneFreeEnergy

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure ChannelTransportPackage where
  permeability : Prop
  selectivity : Prop
  gatingMechanism : Prop
  ionFluxEquation : Prop

structure ChannelTransportEvidence (T : ChannelTransportPackage) where
  permeabilityClosed : T.permeability
  selectivityClosed : T.selectivity
  gatingMechanismClosed : T.gatingMechanism
  ionFluxEquationClosed : T.ionFluxEquation

def ChannelTransportClosed (T : ChannelTransportPackage) : Prop :=
  T.permeability ∧ T.selectivity ∧ T.gatingMechanism ∧ T.ionFluxEquation

theorem channel_transport_closed_from_evidence
    (T : ChannelTransportPackage) (E : ChannelTransportEvidence T) :
    ChannelTransportClosed T := by
  exact And.intro E.permeabilityClosed
    (And.intro E.selectivityClosed
      (And.intro E.gatingMechanismClosed E.ionFluxEquationClosed))

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse