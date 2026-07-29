import EarthScienceHydrogeologyCanonicalLaneLean.GroundwaterTransport

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure PorousMediaMechanicsPackage {A : AquiferFlowPackage} {T : GroundwaterTransportPackage A} where
  effectiveStress : Prop
  porosityChange : Prop
  consolidation : Prop
  fracturing : Prop

structure PorousMediaMechanicsEvidence {A : AquiferFlowPackage} {T : GroundwaterTransportPackage A} (M : PorousMediaMechanicsPackage A T) where
  effectiveStressClosed : M.effectiveStress
  porosityChangeClosed : M.porosityChange
  consolidationClosed : M.consolidation
  fracturingClosed : M.fracturing

def PorousMediaMechanicsClosed {A : AquiferFlowPackage} {T : GroundwaterTransportPackage A} (M : PorousMediaMechanicsPackage A T) : Prop :=
  M.effectiveStress ∧ M.porosityChange ∧ M.consolidation ∧ M.fracturing

theorem porous_media_mechanics_closed_from_evidence {A : AquiferFlowPackage} {T : GroundwaterTransportPackage A} (M : PorousMediaMechanicsPackage A T) (E : PorousMediaMechanicsEvidence M) :
    PorousMediaMechanicsClosed M := by
  exact And.intro E.effectiveStressClosed (And.intro E.porosityChangeClosed (And.intro E.consolidationClosed E.fracturingClosed))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse