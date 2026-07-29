import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure StochasticHydrogeologyPackage where
  monteCarloSimulation : Prop
  geostatisticalModel : Prop
  parameterUncertainty : Prop
  stochasticDifferentialEquation : Prop
  riskAssessment : Prop

structure StochasticHydrogeologyEvidence (S : StochasticHydrogeologyPackage) where
  monteCarloSimulationClosed : S.monteCarloSimulation
  geostatisticalModelClosed : S.geostatisticalModel
  parameterUncertaintyClosed : S.parameterUncertainty
  stochasticDifferentialEquationClosed : S.stochasticDifferentialEquation
  riskAssessmentClosed : S.riskAssessment

def StochasticHydrogeologyClosed (S : StochasticHydrogeologyPackage) : Prop :=
  S.monteCarloSimulation ∧ S.geostatisticalModel ∧ S.parameterUncertainty ∧ S.stochasticDifferentialEquation ∧ S.riskAssessment

theorem stochastic_hydrogeology_closed_from_evidence (S : StochasticHydrogeologyPackage) (E : StochasticHydrogeologyEvidence S) :
    StochasticHydrogeologyClosed S := by
  exact And.intro E.monteCarloSimulationClosed
    (And.intro E.geostatisticalModelClosed
      (And.intro E.parameterUncertaintyClosed
        (And.intro E.stochasticDifferentialEquationClosed E.riskAssessmentClosed)))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse