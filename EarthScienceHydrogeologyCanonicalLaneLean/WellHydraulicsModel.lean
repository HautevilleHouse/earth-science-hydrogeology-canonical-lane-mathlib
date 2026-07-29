import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure WellHydraulicsPackage where
  aquifer : AquiferProperties
  wellRadius : ℝ
  pumpingRate : ℝ
  drawdownDistribution : ℝ → ℝ
  theisEquationSatisfied : Prop
  jacobApproximationValid : Prop
  boundaryEffectAccounted : Prop

structure WellHydraulicsEvidence (W : WellHydraulicsPackage) where
  theisEquationClosed : W.theisEquationSatisfied
  jacobApproximationClosed : W.jacobApproximationValid
  boundaryEffectClosed : W.boundaryEffectAccounted

def WellHydraulicsClosed (W : WellHydraulicsPackage) : Prop :=
  W.theisEquationSatisfied ∧ W.jacobApproximationValid ∧ W.boundaryEffectAccounted

theorem well_hydraulics_closed_from_evidence (W : WellHydraulicsPackage)
    (E : WellHydraulicsEvidence W) : WellHydraulicsClosed W := by
  exact And.intro E.theisEquationClosed
    (And.intro E.jacobApproximationClosed E.boundaryEffectClosed)

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse
