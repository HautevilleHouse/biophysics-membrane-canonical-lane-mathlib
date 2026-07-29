import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure MembraneFreeEnergyPackage where
  bendingRigidity : Prop
  spontaneousCurvature : Prop
  energyFunctional : Prop
  equilibriumCondition : Prop

structure MembraneFreeEnergyEvidence (P : MembraneFreeEnergyPackage) where
  bendingRigidityClosed : P.bendingRigidity
  spontaneousCurvatureClosed : P.spontaneousCurvature
  energyFunctionalClosed : P.energyFunctional
  equilibriumConditionClosed : P.equilibriumCondition

def MembraneFreeEnergyClosed (P : MembraneFreeEnergyPackage) : Prop :=
  P.bendingRigidity ∧ P.spontaneousCurvature ∧ P.energyFunctional ∧ P.equilibriumCondition

theorem membrane_free_energy_closed_from_evidence
    (P : MembraneFreeEnergyPackage) (E : MembraneFreeEnergyEvidence P) :
    MembraneFreeEnergyClosed P := by
  exact And.intro E.bendingRigidityClosed
    (And.intro E.spontaneousCurvatureClosed
      (And.intro E.energyFunctionalClosed E.equilibriumConditionClosed))

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse