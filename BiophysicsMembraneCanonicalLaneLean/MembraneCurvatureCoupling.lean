import BiophysicsMembraneCanonicalLaneLean.IonChannelGating

namespace HautevilleHouse
namespace BiophysicsMembraneCanonicalLaneLean

structure CurvatureCouplingPackage {B : LipidBilayerPackage}
    {E : MembraneElasticityPackage B}
    {P : ProteinBindingPackage E}
    {I : IonChannelPackage P} where
  localCurvatureModulation : Prop
  proteinRecruitmentByCurvature : Prop
  curvatureSensingMechanism : Prop
  feedbackOnElasticity : Prop

structure CurvatureCouplingEvidence {B : LipidBilayerPackage}
    {E : MembraneElasticityPackage B}
    {P : ProteinBindingPackage E}
    {I : IonChannelPackage P}
    (C : CurvatureCouplingPackage I) where
  localCurvatureModulationClosed : C.localCurvatureModulation
  proteinRecruitmentByCurvatureClosed : C.proteinRecruitmentByCurvature
  curvatureSensingMechanismClosed : C.curvatureSensingMechanism
  feedbackOnElasticityClosed : C.feedbackOnElasticity

def CurvatureCouplingClosed {B : LipidBilayerPackage}
    {E : MembraneElasticityPackage B}
    {P : ProteinBindingPackage E}
    {I : IonChannelPackage P}
    (C : CurvatureCouplingPackage I) : Prop :=
  C.localCurvatureModulation ∧ C.proteinRecruitmentByCurvature ∧
  C.curvatureSensingMechanism ∧ C.feedbackOnElasticity

theorem curvature_coupling_closed_from_evidence
    {B : LipidBilayerPackage} {E : MembraneElasticityPackage B}
    {P : ProteinBindingPackage E} {I : IonChannelPackage P}
    (C : CurvatureCouplingPackage I) (Ev : CurvatureCouplingEvidence C) :
    CurvatureCouplingClosed C := by
  exact And.intro Ev.localCurvatureModulationClosed
    (And.intro Ev.proteinRecruitmentByCurvatureClosed
      (And.intro Ev.curvatureSensingMechanismClosed Ev.feedbackOnElasticityClosed))

end BiophysicsMembraneCanonicalLaneLean
end HautevilleHouse
