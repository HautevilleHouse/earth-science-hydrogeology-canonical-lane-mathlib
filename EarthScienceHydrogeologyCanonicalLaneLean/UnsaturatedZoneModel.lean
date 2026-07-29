import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure UnsaturatedZonePackage where
  richardsEquation : Prop
  waterRetentionCurve : Prop
  hydraulicConductivityFunction : Prop
  infiltrationBoundary : Prop
  evaporationTerms : Prop

structure UnsaturatedZoneEvidence (U : UnsaturatedZonePackage) where
  richardsEquationClosed : U.richardsEquation
  waterRetentionCurveClosed : U.waterRetentionCurve
  hydraulicConductivityFunctionClosed : U.hydraulicConductivityFunction
  infiltrationBoundaryClosed : U.infiltrationBoundary
  evaporationTermsClosed : U.evaporationTerms

def UnsaturatedZoneClosed (U : UnsaturatedZonePackage) : Prop :=
  U.richardsEquation ∧ U.waterRetentionCurve ∧ U.hydraulicConductivityFunction ∧ U.infiltrationBoundary ∧ U.evaporationTerms

theorem unsaturated_zone_closed_from_evidence (U : UnsaturatedZonePackage) (E : UnsaturatedZoneEvidence U) : UnsaturatedZoneClosed U := by
  exact And.intro E.richardsEquationClosed
    (And.intro E.waterRetentionCurveClosed
      (And.intro E.hydraulicConductivityFunctionClosed
        (And.intro E.infiltrationBoundaryClosed E.evaporationTermsClosed)))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse