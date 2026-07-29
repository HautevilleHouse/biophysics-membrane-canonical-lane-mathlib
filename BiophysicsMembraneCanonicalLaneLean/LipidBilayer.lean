import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.MembraneElasticity

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure LipidBilayerPackage (G : MembraneElasticityPackage) where
  phospholipidComposition : Prop
  phaseTransition : Prop
  lateralDiffusion : Prop
  flipFlopRate : Prop
  asymmetryMaintained : Prop

structure LipidBilayerEvidence {G : MembraneElasticityPackage}
    (L : LipidBilayerPackage G) where
  phospholipidCompositionClosed : L.phospholipidComposition
  phaseTransitionClosed : L.phaseTransition
  lateralDiffusionClosed : L.lateralDiffusion
  flipFlopRateClosed : L.flipFlopRate
  asymmetryMaintainedClosed : L.asymmetryMaintained

def LipidBilayerClosed {G : MembraneElasticityPackage}
    (L : LipidBilayerPackage G) : Prop :=
  L.phospholipidComposition ∧ L.phaseTransition ∧
  L.lateralDiffusion ∧ L.flipFlopRate ∧ L.asymmetryMaintained

theorem lipid_bilayer_closed_from_evidence
    {G : MembraneElasticityPackage} (L : LipidBilayerPackage G)
    (E : LipidBilayerEvidence L) : LipidBilayerClosed L := by
  exact And.intro E.phospholipidCompositionClosed
    (And.intro E.phaseTransitionClosed
      (And.intro E.lateralDiffusionClosed
        (And.intro E.flipFlopRateClosed E.asymmetryMaintainedClosed)))

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse
