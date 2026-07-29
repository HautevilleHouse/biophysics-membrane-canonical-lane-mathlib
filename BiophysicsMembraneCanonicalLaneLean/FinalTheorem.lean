import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

def ConstrainedMembraneClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_membrane_endgame (A : AdmissibleClass) :
    ConstrainedMembraneClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse
