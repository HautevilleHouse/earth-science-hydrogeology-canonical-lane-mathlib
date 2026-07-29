import EarthScienceHydrogeologyCanonicalLaneLean.PorousMediaMechanics

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure HydrogeologicModel {A : AquiferFlowPackage} {T : GroundwaterTransportPackage A} {M : PorousMediaMechanicsPackage A T} where
  modelDomain : Type u
  modelTopology : TopologicalSpace modelDomain
  parameterField : modelDomain → ℝ
  boundaryData : Prop
  initialData : Prop
  boundaryDataClosed : boundaryData
  initialDataClosed : initialData

structure HydrogeologicModelEvidence {A : AquiferFlowPackage} {T : GroundwaterTransportPackage A} {M : PorousMediaMechanicsPackage A T} (H : HydrogeologicModel A T M) where
  parameterFieldContinuous : Continuous H.parameterField
  boundaryDataClosed : H.boundaryData
  initialDataClosed : H.initialData

def HydrogeologicModelClosed {A : AquiferFlowPackage} {T : GroundwaterTransportPackage A} {M : PorousMediaMechanicsPackage A T} (H : HydrogeologicModel A T M) : Prop :=
  H.boundaryData ∧ H.initialData

theorem hydrogeologic_model_closed_from_evidence {A : AquiferFlowPackage} {T : GroundwaterTransportPackage A} {M : PorousMediaMechanicsPackage A T} (H : HydrogeologicModel A T M) (E : HydrogeologicModelEvidence H) : HydrogeologicModelClosed H := by
  exact And.intro E.boundaryDataClosed E.initialDataClosed

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse