import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.MembraneComposition

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure LipidBilayerElasticityPackage (C : MembraneCompositionPackage) where
  bendingRigidity : Type u
  areaCompressionModulus : Type v
  spontaneousCurvature : Type w
  elasticEnergy : Type x
  hamiltonianDefined : Prop
  equilibriumCondition : Prop

structure LipidBilayerElasticityEvidence {C : MembraneCompositionPackage}
    (P : LipidBilayerElasticityPackage C) where
  hamiltonianDefinedClosed : P.hamiltonianDefined
  equilibriumConditionClosed : P.equilibriumCondition

def LipidBilayerElasticityClosed {C : MembraneCompositionPackage}
    (P : LipidBilayerElasticityPackage C) : Prop :=
  P.hamiltonianDefined ∧ P.equilibriumCondition

theorem lipid_bilayer_elasticity_closed_from_evidence
    {C : MembraneCompositionPackage} (P : LipidBilayerElasticityPackage C)
    (E : LipidBilayerElasticityEvidence P) : LipidBilayerElasticityClosed P := by
  exact And.intro E.hamiltonianDefinedClosed E.equilibriumConditionClosed

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse