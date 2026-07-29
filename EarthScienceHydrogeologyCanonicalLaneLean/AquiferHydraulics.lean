import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure AquiferHydraulicsPackage where
  porosityModel : Prop
  transmissivityField : Prop
  darcyFluxLaw : Prop
  specificYield : Prop

structure AquiferHydraulicsEvidence (A : AquiferHydraulicsPackage) where
  porosityModelClosed : A.porosityModel
  transmissivityFieldClosed : A.transmissivityField
  darcyFluxLawClosed : A.darcyFluxLaw
  specificYieldClosed : A.specificYield

def AquiferHydraulicsClosed (A : AquiferHydraulicsPackage) : Prop :=
  A.porosityModel ∧ A.transmissivityField ∧ A.darcyFluxLaw ∧ A.specificYield

theorem aquifer_hydraulics_closed_from_evidence (A : AquiferHydraulicsPackage)
    (E : AquiferHydraulicsEvidence A) : AquiferHydraulicsClosed A := by
  exact And.intro E.porosityModelClosed
    (And.intro E.transmissivityFieldClosed
      (And.intro E.darcyFluxLawClosed E.specificYieldClosed))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse