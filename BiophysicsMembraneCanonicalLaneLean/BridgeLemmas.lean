import HautevilleHouse.BiophysicsMembraneCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MembraneWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse
