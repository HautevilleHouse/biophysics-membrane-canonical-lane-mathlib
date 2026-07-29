import BiophysicsMembraneCanonicalLaneLean.MembraneAdmissibleClass

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure LipidBilayerPackage where
  lipidType : Type u
  headGroup : Type v
  tailLength : Nat
  bilayerThickness : Prop
  fluidityMosaic : Prop
  phaseTransitionTemperature : Prop

structure LipidBilayerEvidence (L : LipidBilayerPackage) where
  bilayerThicknessClosed : L.bilayerThickness
  fluidityMosaicClosed : L.fluidityMosaic
  phaseTransitionTemperatureClosed : L.phaseTransitionTemperature

def LipidBilayerClosed (L : LipidBilayerPackage) : Prop :=
  L.bilayerThickness ∧ L.fluidityMosaic ∧ L.phaseTransitionTemperature

theorem lipid_bilayer_closed_from_evidence (L : LipidBilayerPackage) (E : LipidBilayerEvidence L) :
    LipidBilayerClosed L := by
  exact And.intro E.bilayerThicknessClosed (And.intro E.fluidityMosaicClosed E.phaseTransitionTemperatureClosed)

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse
