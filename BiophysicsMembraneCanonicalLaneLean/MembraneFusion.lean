import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.IonChannelGating

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure MembraneFusionPackage {C : MembraneCompositionPackage}
    {E : LipidBilayerElasticityPackage C} {G : IonChannelGatingPackage E} where
  fusionPore : Type u
  hemifusionStalk : Type v
  fusionEnergetics : Type w
  stalkFormation : Prop
  poreExpansion : Prop
  lipidMixing : Prop

structure MembraneFusionEvidence {C : MembraneCompositionPackage}
    {E : LipidBilayerElasticityPackage C} {G : IonChannelGatingPackage E}
    (F : MembraneFusionPackage G) where
  stalkFormationClosed : F.stalkFormation
  poreExpansionClosed : F.poreExpansion
  lipidMixingClosed : F.lipidMixing

def MembraneFusionClosed {C : MembraneCompositionPackage}
    {E : LipidBilayerElasticityPackage C} {G : IonChannelGatingPackage E}
    (F : MembraneFusionPackage G) : Prop :=
  F.stalkFormation ∧ F.poreExpansion ∧ F.lipidMixing

theorem membrane_fusion_closed_from_evidence
    {C : MembraneCompositionPackage} {E : LipidBilayerElasticityPackage C}
    {G : IonChannelGatingPackage E} (F : MembraneFusionPackage G)
    (Ev : MembraneFusionEvidence F) : MembraneFusionClosed F := by
  exact And.intro Ev.stalkFormationClosed
    (And.intro Ev.poreExpansionClosed Ev.lipidMixingClosed)

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse