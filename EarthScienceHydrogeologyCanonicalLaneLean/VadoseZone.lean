import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure VadoseZonePackage where
  soilWaterRetention : Prop
  unsaturatedConductivity : Prop
  richardsEquation : Prop
  infiltrationModel : Prop
  evaporationModel : Prop

structure VadoseZoneEvidence (V : VadoseZonePackage) where
  soilWaterRetentionClosed : V.soilWaterRetention
  unsaturatedConductivityClosed : V.unsaturatedConductivity
  richardsEquationClosed : V.richardsEquation
  infiltrationModelClosed : V.infiltrationModel
  evaporationModelClosed : V.evaporationModel

def VadoseZoneClosed (V : VadoseZonePackage) : Prop :=
  V.soilWaterRetention ∧ V.unsaturatedConductivity ∧ V.richardsEquation ∧
  V.infiltrationModel ∧ V.evaporationModel

theorem vadose_zone_closed_from_evidence (V : VadoseZonePackage)
    (E : VadoseZoneEvidence V) : VadoseZoneClosed V := by
  exact And.intro E.soilWaterRetentionClosed
    (And.intro E.unsaturatedConductivityClosed
      (And.intro E.richardsEquationClosed
        (And.intro E.infiltrationModelClosed E.evaporationModelClosed)))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse