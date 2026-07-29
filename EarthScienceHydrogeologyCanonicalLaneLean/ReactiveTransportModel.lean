import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure ReactiveTransportPackage where
  geochemicalReactions : Type u
  biologicalProcesses : Type v
  kineticRateLaws : Prop
  equilibriumSpeciation : Prop
  couplingToFlow : Prop

structure ReactiveTransportEvidence (R : ReactiveTransportPackage) where
  kineticRateLawsClosed : R.kineticRateLaws
  equilibriumSpeciationClosed : R.equilibriumSpeciation
  couplingToFlowClosed : R.couplingToFlow

def ReactiveTransportClosed (R : ReactiveTransportPackage) : Prop :=
  R.kineticRateLaws ∧ R.equilibriumSpeciation ∧ R.couplingToFlow

theorem reactive_transport_closed_from_evidence (R : ReactiveTransportPackage) (E : ReactiveTransportEvidence R) : ReactiveTransportClosed R := by
  exact And.intro E.kineticRateLawsClosed (And.intro E.equilibriumSpeciationClosed E.couplingToFlowClosed)

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse