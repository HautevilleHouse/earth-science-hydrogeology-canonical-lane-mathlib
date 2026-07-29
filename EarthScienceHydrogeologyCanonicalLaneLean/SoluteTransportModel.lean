import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure SoluteTransportPackage where
  flowField : GroundwaterFlowPackage
  dispersionCoefficient : ℝ
  molecularDiffusion : ℝ
  retardationFactor : ℝ
  sourceTerm : ℝ → ℝ
  initialConcentration : ℝ → ℝ
  advectionDispersionEquationSatisfied : Prop
  massConservationSatisfied : Prop

structure SoluteTransportEvidence
    {G : GroundwaterFlowPackage} (S : SoluteTransportPackage G) where
  advectionDispersionEquationClosed : S.advectionDispersionEquationSatisfied
  massConservationClosed : S.massConservationSatisfied

def SoluteTransportClosed {G : GroundwaterFlowPackage} (S : SoluteTransportPackage G) : Prop :=
  S.advectionDispersionEquationSatisfied ∧ S.massConservationSatisfied

theorem solute_transport_closed_from_evidence
    {G : GroundwaterFlowPackage} (S : SoluteTransportPackage G)
    (E : SoluteTransportEvidence S) : SoluteTransportClosed S := by
  exact And.intro E.advectionDispersionEquationClosed E.massConservationClosed

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse
