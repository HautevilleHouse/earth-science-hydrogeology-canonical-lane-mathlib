import EarthScienceHydrogeologyCanonicalLaneLean.AquiferFlow

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure GroundwaterTransportPackage {A : AquiferFlowPackage} where
  advectionDispersion : Prop
  chemicalReaction : Prop
  retardationFactor : Prop
  initialCondition : Prop

structure GroundwaterTransportEvidence {A : AquiferFlowPackage} (T : GroundwaterTransportPackage A) where
  advectionDispersionClosed : T.advectionDispersion
  chemicalReactionClosed : T.chemicalReaction
  retardationFactorClosed : T.retardationFactor
  initialConditionClosed : T.initialCondition

def GroundwaterTransportClosed {A : AquiferFlowPackage} (T : GroundwaterTransportPackage A) : Prop :=
  T.advectionDispersion ∧ T.chemicalReaction ∧ T.retardationFactor ∧ T.initialCondition

theorem groundwater_transport_closed_from_evidence {A : AquiferFlowPackage} (T : GroundwaterTransportPackage A) (E : GroundwaterTransportEvidence T) :
    GroundwaterTransportClosed T := by
  exact And.intro E.advectionDispersionClosed (And.intro E.chemicalReactionClosed (And.intro E.retardationFactorClosed E.initialConditionClosed))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse