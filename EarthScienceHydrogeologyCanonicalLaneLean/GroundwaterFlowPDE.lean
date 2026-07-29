import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure GroundwaterFlowPDEPackage where
  hydraulicHeadField : Prop
  hydraulicConductivityTensor : Prop
  storageCoefficient : Prop
  darcyEquation : Prop
  continuityEquation : Prop

structure GroundwaterFlowPDEEvidence (F : GroundwaterFlowPDEPackage) where
  hydraulicHeadFieldClosed : F.hydraulicHeadField
  hydraulicConductivityTensorClosed : F.hydraulicConductivityTensor
  storageCoefficientClosed : F.storageCoefficient
  darcyEquationClosed : F.darcyEquation
  continuityEquationClosed : F.continuityEquation

def GroundwaterFlowPDEClosed (F : GroundwaterFlowPDEPackage) : Prop :=
  F.hydraulicHeadField ∧ F.hydraulicConductivityTensor ∧
  F.storageCoefficient ∧ F.darcyEquation ∧ F.continuityEquation

theorem groundwater_flow_pde_closed_from_evidence (F : GroundwaterFlowPDEPackage)
    (E : GroundwaterFlowPDEEvidence F) : GroundwaterFlowPDEClosed F := by
  exact And.intro E.hydraulicHeadFieldClosed
    (And.intro E.hydraulicConductivityTensorClosed
      (And.intro E.storageCoefficientClosed
        (And.intro E.darcyEquationClosed E.continuityEquationClosed)))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse