import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure AquiferFlowPackage where
  hydraulicConductivity : Prop
  storativity : Prop
  darcyVelocity : Prop
  continuityEquation : Prop
  boundaryConditions : Prop

structure AquiferFlowEvidence (A : AquiferFlowPackage) where
  hydraulicConductivityClosed : A.hydraulicConductivity
  storativityClosed : A.storativity
  darcyVelocityClosed : A.darcyVelocity
  continuityEquationClosed : A.continuityEquation
  boundaryConditionsClosed : A.boundaryConditions

def AquiferFlowClosed (A : AquiferFlowPackage) : Prop :=
  A.hydraulicConductivity ∧ A.storativity ∧ A.darcyVelocity ∧ A.continuityEquation ∧ A.boundaryConditions

theorem aquifer_flow_closed_from_evidence (A : AquiferFlowPackage) (E : AquiferFlowEvidence A) :
    AquiferFlowClosed A := by
  exact And.intro E.hydraulicConductivityClosed
    (And.intro E.storativityClosed
      (And.intro E.darcyVelocityClosed
        (And.intro E.continuityEquationClosed E.boundaryConditionsClosed)))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse