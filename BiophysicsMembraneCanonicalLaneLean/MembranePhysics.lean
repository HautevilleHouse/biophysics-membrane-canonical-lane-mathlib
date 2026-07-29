import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.MembraneAdmissibleClass

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure LipidPacking where
  headGroupArea : ℝ
  tailLength : ℝ
  bilayerThickness : ℝ
  curvatureElasticity : ℝ

structure MembraneElasticity where
  bendingRigidity : ℝ
  spontaneousCurvature : ℝ
  stretchModulus : ℝ
  shearModulus : ℝ

structure PhysicsEvidence (L : LipidPacking) (E : MembraneElasticity) where
  packingCompatible : L.bilayerThickness > 0 ∧ L.curvatureElasticity > 0
  elasticityCompatible : E.bendingRigidity > 0 ∧ E.spontaneousCurvature ≠ 0

def PhysicsClosed (L : LipidPacking) (E : MembraneElasticity) : Prop :=
  L.bilayerThickness > 0 ∧ L.curvatureElasticity > 0 ∧
  E.bendingRigidity > 0 ∧ E.spontaneousCurvature ≠ 0

theorem physics_closed_from_evidence (L : LipidPacking) (E : MembraneElasticity)
    (ev : PhysicsEvidence L E) : PhysicsClosed L E := by
  exact And.intro ev.packingCompatible.1 (And.intro ev.packingCompatible.2
    (And.intro ev.elasticityCompatible.1 ev.elasticityCompatible.2))

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse