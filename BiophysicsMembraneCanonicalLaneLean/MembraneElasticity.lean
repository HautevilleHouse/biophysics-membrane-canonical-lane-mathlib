import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure MembraneElasticityPackage where
  bilayer : Type u
  bendingRigidity : Type v
  surfaceTension : Type w
  areaDifference : Type x
  spontaneousCurvature : Type y
  hymanHelmholtzFreeEnergy : Prop
  fluidMosaicModel : Prop
  elasticConstantsDefined : Prop

structure MembraneElasticityEvidence (G : MembraneElasticityPackage) where
  hymanHelmholtzFreeEnergyClosed : G.hymanHelmholtzFreeEnergy
  fluidMosaicModelClosed : G.fluidMosaicModel
  elasticConstantsDefinedClosed : G.elasticConstantsDefined

def MembraneElasticityClosed (G : MembraneElasticityPackage) : Prop :=
  G.hymanHelmholtzFreeEnergy ∧ G.fluidMosaicModel ∧ G.elasticConstantsDefined

theorem membrane_elasticity_closed_from_evidence
    (G : MembraneElasticityPackage) (E : MembraneElasticityEvidence G) :
    MembraneElasticityClosed G := by
  exact And.intro E.hymanHelmholtzFreeEnergyClosed
    (And.intro E.fluidMosaicModelClosed E.elasticConstantsDefinedClosed)

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse
