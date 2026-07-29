import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure WellHydraulicsPackage where
  theisSolution : Prop
  cooperJacobMethod : Prop
  wellboreStorage : Prop
  skinEffect : Prop
  pumpingTestAnalysis : Prop

structure WellHydraulicsEvidence (W : WellHydraulicsPackage) where
  theisSolutionClosed : W.theisSolution
  cooperJacobMethodClosed : W.cooperJacobMethod
  wellboreStorageClosed : W.wellboreStorage
  skinEffectClosed : W.skinEffect
  pumpingTestAnalysisClosed : W.pumpingTestAnalysis

def WellHydraulicsClosed (W : WellHydraulicsPackage) : Prop :=
  W.theisSolution ∧ W.cooperJacobMethod ∧ W.wellboreStorage ∧ W.skinEffect ∧ W.pumpingTestAnalysis

theorem well_hydraulics_closed_from_evidence (W : WellHydraulicsPackage) (E : WellHydraulicsEvidence W) :
    WellHydraulicsClosed W := by
  exact And.intro E.theisSolutionClosed
    (And.intro E.cooperJacobMethodClosed
      (And.intro E.wellboreStorageClosed
        (And.intro E.skinEffectClosed E.pumpingTestAnalysisClosed)))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse