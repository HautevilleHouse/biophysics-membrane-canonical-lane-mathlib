import BiophysicsMembraneCanonicalLaneLean.ReviewerBridge
import BiophysicsMembraneCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  membraneConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement :=
  {
    sourceKey := "biophysics-membrane-canonical-lane",
    theoremName := "biophysics-membrane-canonical-lane",
    theoremObject := "membrane-structure-and-function",
    classicalBoundary := "membrane biophysics classical domain (lipid bilayer, transport, signaling)",
    membraneConstrainedStatement := "membrane-constrained theorem certificate internalized through baseline gates, source constants, reviewer bridge, manifest hashes, and outside-constant dependency count",
    certificateLane := "membrane_constrained",
    carriedRemainder := "classical source boundary carried by formalizationCertificate.theoremBoundaryOpen and sourceTheoremBoundary"
  }

theorem theorem_statement_defined :
    sourceTheoremStatement.sourceKey = "biophysics-membrane-canonical-lane" := by
  rfl

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse