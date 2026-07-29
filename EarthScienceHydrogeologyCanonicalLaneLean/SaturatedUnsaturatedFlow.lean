import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure SaturatedUnsaturatedFlowPackage where
  richardsEquation : Prop
  vanGenuchtenModel : Prop
  brooksCoreyModel : Prop
  soilWaterRetention : Prop
  hydraulicConductivityFunction : Prop
  hysteresis : Prop

structure SaturatedUnsaturatedFlowEvidence (S : SaturatedUnsaturatedFlowPackage) where
  richardsEquationClosed : S.richardsEquation
  vanGenuchtenModelClosed : S.vanGenuchtenModel
  brooksCoreyModelClosed : S.brooksCoreyModel
  soilWaterRetentionClosed : S.soilWaterRetention
  hydraulicConductivityFunctionClosed : S.hydraulicConductivityFunction
  hysteresisClosed : S.hysteresis

def SaturatedUnsaturatedFlowClosed (S : SaturatedUnsaturatedFlowPackage) : Prop :=
  S.richardsEquation ∧ S.vanGenuchtenModel ∧ S.brooksCoreyModel ∧
  S.soilWaterRetention ∧ S.hydraulicConductivityFunction ∧ S.hysteresis

theorem saturated_unsaturated_flow_closed_from_evidence (S : SaturatedUnsaturatedFlowPackage) (E : SaturatedUnsaturatedFlowEvidence S) :
    SaturatedUnsaturatedFlowClosed S := by
  exact And.intro E.richardsEquationClosed
    (And.intro E.vanGenuchtenModelClosed
      (And.intro E.brooksCoreyModelClosed
        (And.intro E.soilWaterRetentionClosed
          (And.intro E.hydraulicConductivityFunctionClosed E.hysteresisClosed))))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse