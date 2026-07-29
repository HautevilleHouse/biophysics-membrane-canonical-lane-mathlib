import BiophysicsMembraneCanonicalLaneLean.SignalingPathways

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure MembraneProteinStructurePackage {L : LipidBilayerPackage} {T : TransportPhenomenaPackage L} {S : SignalingPathwaysPackage L T} where
  transmembraneTopology : Prop
  foldingStability : Prop
  ligandBinding : Prop
  conformationalDynamics : Prop

structure MembraneProteinStructureEvidence {L : LipidBilayerPackage} {T : TransportPhenomenaPackage L} {S : SignalingPathwaysPackage L T} (M : MembraneProteinStructurePackage L T S) where
  transmembraneTopologyClosed : M.transmembraneTopology
  foldingStabilityClosed : M.foldingStability
  ligandBindingClosed : M.ligandBinding
  conformationalDynamicsClosed : M.conformationalDynamics

def MembraneProteinStructureClosed {L : LipidBilayerPackage} {T : TransportPhenomenaPackage L} {S : SignalingPathwaysPackage L T} (M : MembraneProteinStructurePackage L T S) : Prop :=
  M.transmembraneTopology ∧ M.foldingStability ∧ M.ligandBinding ∧ M.conformationalDynamics

theorem membrane_protein_structure_closed_from_evidence {L : LipidBilayerPackage} {T : TransportPhenomenaPackage L} {S : SignalingPathwaysPackage L T} (M : MembraneProteinStructurePackage L T S) (E : MembraneProteinStructureEvidence M) :
    MembraneProteinStructureClosed M := by
  exact And.intro E.transmembraneTopologyClosed (And.intro E.foldingStabilityClosed (And.intro E.ligandBindingClosed E.conformationalDynamicsClosed))

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse