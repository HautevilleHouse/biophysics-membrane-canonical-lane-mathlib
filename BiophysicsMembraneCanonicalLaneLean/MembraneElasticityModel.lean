import BiophysicsMembraneCanonicalLaneLean.LipidBilayerStructure

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure MembraneElasticityPackage (B : LipidBilayerPackage) where
  bendingRigidity : Prop
  spontaneousCurvature : Prop
  areaDifferenceElasticity : Prop
  gaussianCurvatureModulus : Prop

structure MembraneElasticityEvidence {B : LipidBilayerPackage} (E : MembraneElasticityPackage B) where
  bendingRigidityClosed : E.bendingRigidity
  spontaneousCurvatureClosed : E.spontaneousCurvature
  areaDifferenceElasticityClosed : E.areaDifferenceElasticity
  gaussianCurvatureModulusClosed : E.gaussianCurvatureModulus

def MembraneElasticityClosed {B : LipidBilayerPackage} (E : MembraneElasticityPackage B) : Prop :=
  E.bendingRigidity ∧ E.spontaneousCurvature ∧
  E.areaDifferenceElasticity ∧ E.gaussianCurvatureModulus

theorem membrane_elasticity_closed_from_evidence
    {B : LipidBilayerPackage} (E : MembraneElasticityPackage B)
    (Ev : MembraneElasticityEvidence E) : MembraneElasticityClosed E := by
  exact And.intro Ev.bendingRigidityClosed
    (And.intro Ev.spontaneousCurvatureClosed
      (And.intro Ev.areaDifferenceElasticityClosed Ev.gaussianCurvatureModulusClosed))

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse
