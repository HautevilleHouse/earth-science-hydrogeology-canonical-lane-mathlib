import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure ContaminantTransportPackage where
  advectionDispersionEquation : Prop
  retardationFactor : Prop
  decayRate : Prop
  initialCondition : Prop
  sourceTerm : Prop

structure ContaminantTransportEvidence (C : ContaminantTransportPackage) where
  advectionDispersionEquationClosed : C.advectionDispersionEquation
  retardationFactorClosed : C.retardationFactor
  decayRateClosed : C.decayRate
  initialConditionClosed : C.initialCondition
  sourceTermClosed : C.sourceTerm

def ContaminantTransportClosed (C : ContaminantTransportPackage) : Prop :=
  C.advectionDispersionEquation ∧ C.retardationFactor ∧ C.decayRate ∧ C.initialCondition ∧ C.sourceTerm

theorem contaminant_transport_closed_from_evidence (C : ContaminantTransportPackage) (E : ContaminantTransportEvidence C) :
    ContaminantTransportClosed C := by
  exact And.intro E.advectionDispersionEquationClosed
    (And.intro E.retardationFactorClosed
      (And.intro E.decayRateClosed
        (And.intro E.initialConditionClosed E.sourceTermClosed)))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse