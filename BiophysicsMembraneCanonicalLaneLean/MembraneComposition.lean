import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure MembraneCompositionPackage where
  lipidTypes : Type u
  proteinTypes : Type v
  cholesterolFraction : Type w
  phaseBehavior : Prop
  fluidity : Prop

structure MembraneCompositionEvidence (P : MembraneCompositionPackage) where
  phaseBehaviorClosed : P.phaseBehavior
  fluidityClosed : P.fluidity

def MembraneCompositionClosed (P : MembraneCompositionPackage) : Prop :=
  P.phaseBehavior ∧ P.fluidity

theorem membrane_composition_closed_from_evidence
    (P : MembraneCompositionPackage) (E : MembraneCompositionEvidence P) :
    MembraneCompositionClosed P := by
  exact And.intro E.phaseBehaviorClosed E.fluidityClosed

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse