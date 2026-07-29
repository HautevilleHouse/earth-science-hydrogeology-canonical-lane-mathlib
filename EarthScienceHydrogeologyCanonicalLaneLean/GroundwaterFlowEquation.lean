import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure GroundwaterFlowEquationPackage where
  darcyFlux : Prop
  continuityEquation : Prop
  specificStorage : Prop
  hydraulicHead : Prop
  boundaryConditions : Prop
  initialCondition : Prop

structure GroundwaterFlowEquationEvidence (G : GroundwaterFlowEquationPackage) where
  darcyFluxClosed : G.darcyFlux
  continuityEquationClosed : G.continuityEquation
  specificStorageClosed : G.specificStorage
  hydraulicHeadClosed : G.hydraulicHead
  boundaryConditionsClosed : G.boundaryConditions
  initialConditionClosed : G.initialCondition

def GroundwaterFlowEquationClosed (G : GroundwaterFlowEquationPackage) : Prop :=
  G.darcyFlux ∧ G.continuityEquation ∧ G.specificStorage ∧
  G.hydraulicHead ∧ G.boundaryConditions ∧ G.initialCondition

theorem groundwater_flow_equation_closed_from_evidence (G : GroundwaterFlowEquationPackage) (E : GroundwaterFlowEquationEvidence G) :
    GroundwaterFlowEquationClosed G := by
  exact And.intro E.darcyFluxClosed
    (And.intro E.continuityEquationClosed
      (And.intro E.specificStorageClosed
        (And.intro E.hydraulicHeadClosed
          (And.intro E.boundaryConditionsClosed E.initialConditionClosed))))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse