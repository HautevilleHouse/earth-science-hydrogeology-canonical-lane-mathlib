import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure FracturedMediaPackage where
  fractureNetworkGeometry : Type u
  matrixPermeability : Type v
  dualContinuumApproach : Prop
  fractureMatrixExchangeTerm : Prop
  equivalentContinuumModel : Prop

structure FracturedMediaEvidence (F : FracturedMediaPackage) where
  dualContinuumApproachClosed : F.dualContinuumApproach
  fractureMatrixExchangeTermClosed : F.fractureMatrixExchangeTerm
  equivalentContinuumModelClosed : F.equivalentContinuumModel

def FracturedMediaClosed (F : FracturedMediaPackage) : Prop :=
  F.dualContinuumApproach ∧ F.fractureMatrixExchangeTerm ∧ F.equivalentContinuumModel

theorem fractured_media_closed_from_evidence (F : FracturedMediaPackage) (E : FracturedMediaEvidence F) : FracturedMediaClosed F := by
  exact And.intro E.dualContinuumApproachClosed (And.intro E.fractureMatrixExchangeTermClosed E.equivalentContinuumModelClosed)

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse