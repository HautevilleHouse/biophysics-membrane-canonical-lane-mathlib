import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.LipidBilayer

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure TransmembranePotentialPackage {G : MembraneElasticityPackage}
    (L : LipidBilayerPackage G) where
  restingPotential : Prop
  actionPotential : Prop
  ionPumps : Prop
  electrodiffusion : Prop
  capacitance : Prop

structure TransmembranePotentialEvidence {G : MembraneElasticityPackage}
    {L : LipidBilayerPackage G} (T : TransmembranePotentialPackage L) where
  restingPotentialClosed : T.restingPotential
  actionPotentialClosed : T.actionPotential
  ionPumpsClosed : T.ionPumps
  electrodiffusionClosed : T.electrodiffusion
  capacitanceClosed : T.capacitance

def TransmembranePotentialClosed {G : MembraneElasticityPackage}
    {L : LipidBilayerPackage G} (T : TransmembranePotentialPackage L) : Prop :=
  T.restingPotential ∧ T.actionPotential ∧
  T.ionPumps ∧ T.electrodiffusion ∧ T.capacitance

theorem transmembrane_potential_closed_from_evidence
    {G : MembraneElasticityPackage} {L : LipidBilayerPackage G}
    (T : TransmembranePotentialPackage L)
    (E : TransmembranePotentialEvidence T) : TransmembranePotentialClosed T := by
  exact And.intro E.restingPotentialClosed
    (And.intro E.actionPotentialClosed
      (And.intro E.ionPumpsClosed
        (And.intro E.electrodiffusionClosed E.capacitanceClosed)))

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse
