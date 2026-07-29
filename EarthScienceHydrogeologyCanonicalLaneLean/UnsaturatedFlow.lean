import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure UnsaturatedFlowPackage where
  richardsEquation : Prop
  soilWaterCharacteristic : Prop
  hydraulicConductivityFunction : Prop
  infiltrationRate : Prop
  boundaryConditions : Prop

structure UnsaturatedFlowEvidence (U : UnsaturatedFlowPackage) where
  richardsEquationClosed : U.richardsEquation
  soilWaterCharacteristicClosed : U.soilWaterCharacteristic
  hydraulicConductivityFunctionClosed : U.hydraulicConductivityFunction
  infiltrationRateClosed : U.infiltrationRate
  boundaryConditionsClosed : U.boundaryConditions

def UnsaturatedFlowClosed (U : UnsaturatedFlowPackage) : Prop :=
  U.richardsEquation ∧ U.soilWaterCharacteristic ∧ U.hydraulicConductivityFunction ∧ U.infiltrationRate ∧ U.boundaryConditions

theorem unsaturated_flow_closed_from_evidence (U : UnsaturatedFlowPackage) (E : UnsaturatedFlowEvidence U) :
    UnsaturatedFlowClosed U := by
  exact And.intro E.richardsEquationClosed
    (And.intro E.soilWaterCharacteristicClosed
      (And.intro E.hydraulicConductivityFunctionClosed
        (And.intro E.infiltrationRateClosed E.boundaryConditionsClosed)))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse