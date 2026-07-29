import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure HydrogeochemistryPackage where
  majorIonsModel : Prop
  redoxReactions : Prop
  mineralSaturationIndices : Prop
  isotopicFractionation : Prop
  waterRockInteraction : Prop

structure HydrogeochemistryEvidence (H : HydrogeochemistryPackage) where
  majorIonsModelClosed : H.majorIonsModel
  redoxReactionsClosed : H.redoxReactions
  mineralSaturationIndicesClosed : H.mineralSaturationIndices
  isotopicFractionationClosed : H.isotopicFractionation
  waterRockInteractionClosed : H.waterRockInteraction

def HydrogeochemistryClosed (H : HydrogeochemistryPackage) : Prop :=
  H.majorIonsModel ∧ H.redoxReactions ∧ H.mineralSaturationIndices ∧
  H.isotopicFractionation ∧ H.waterRockInteraction

theorem hydrogeochemistry_closed_from_evidence (H : HydrogeochemistryPackage)
    (E : HydrogeochemistryEvidence H) : HydrogeochemistryClosed H := by
  exact And.intro E.majorIonsModelClosed
    (And.intro E.redoxReactionsClosed
      (And.intro E.mineralSaturationIndicesClosed
        (And.intro E.isotopicFractionationClosed E.waterRockInteractionClosed)))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse