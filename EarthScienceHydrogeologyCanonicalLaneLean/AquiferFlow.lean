import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure AquiferFlowPackage where
  darcyFlux : Prop
  hydraulicConductivity : Prop
  storageCoefficient : Prop
  boundaryConditions : Prop
  sourceSinkTerms : Prop

structure AquiferFlowEvidence (A : AquiferFlowPackage) where
  darcyFluxClosed : A.darcyFlux
  hydraulicConductivityClosed : A.hydraulicConductivity
  storageCoefficientClosed : A.storageCoefficient
  boundaryConditionsClosed : A.boundaryConditions
  sourceSinkTermsClosed : A.sourceSinkTerms

def AquiferFlowClosed (A : AquiferFlowPackage) : Prop :=
  A.darcyFlux ∧ A.hydraulicConductivity ∧ A.storageCoefficient ∧ A.boundaryConditions ∧ A.sourceSinkTerms

theorem aquifer_flow_closed_from_evidence (A : AquiferFlowPackage) (E : AquiferFlowEvidence A) :
    AquiferFlowClosed A := by
  exact And.intro E.darcyFluxClosed (And.intro E.hydraulicConductivityClosed (And.intro E.storageCoefficientClosed (And.intro E.boundaryConditionsClosed E.sourceSinkTermsClosed)))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse