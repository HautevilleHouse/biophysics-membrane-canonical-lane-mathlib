import BiophysicsMembraneCanonicalLaneLean.MembraneElasticityModel

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure ProteinBindingPackage {B : LipidBilayerPackage}
    {E : MembraneElasticityPackage B} where
  bindingAffinity : Prop
  associationRate : Prop
  dissociationRate : Prop
  equilibriumConstant : Prop
  cooperativity : Prop

structure ProteinBindingEvidence {B : LipidBilayerPackage}
    {E : MembraneElasticityPackage B} (P : ProteinBindingPackage E) where
  bindingAffinityClosed : P.bindingAffinity
  associationRateClosed : P.associationRate
  dissociationRateClosed : P.dissociationRate
  equilibriumConstantClosed : P.equilibriumConstant
  cooperativityClosed : P.cooperativity

def ProteinBindingClosed {B : LipidBilayerPackage}
    {E : MembraneElasticityPackage B} (P : ProteinBindingPackage E) : Prop :=
  P.bindingAffinity ∧ P.associationRate ∧
  P.dissociationRate ∧ P.equilibriumConstant ∧ P.cooperativity

theorem protein_binding_closed_from_evidence
    {B : LipidBilayerPackage} {E : MembraneElasticityPackage B}
    (P : ProteinBindingPackage E) (Ev : ProteinBindingEvidence P) :
    ProteinBindingClosed P := by
  exact And.intro Ev.bindingAffinityClosed
    (And.intro Ev.associationRateClosed
      (And.intro Ev.dissociationRateClosed
        (And.intro Ev.equilibriumConstantClosed Ev.cooperativityClosed)))

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse
