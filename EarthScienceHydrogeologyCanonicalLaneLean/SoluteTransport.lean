import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure SoluteTransportPackage where
  advectionTerm : Prop
  dispersionTensor : Prop
  reactionKinetics : Prop
  sourceSinkTerm : Prop

structure SoluteTransportEvidence (T : SoluteTransportPackage) where
  advectionTermClosed : T.advectionTerm
  dispersionTensorClosed : T.dispersionTensor
  reactionKineticsClosed : T.reactionKinetics
  sourceSinkTermClosed : T.sourceSinkTerm

def SoluteTransportClosed (T : SoluteTransportPackage) : Prop :=
  T.advectionTerm ∧ T.dispersionTensor ∧ T.reactionKinetics ∧ T.sourceSinkTerm

theorem solute_transport_closed_from_evidence (T : SoluteTransportPackage)
    (E : SoluteTransportEvidence T) : SoluteTransportClosed T := by
  exact And.intro E.advectionTermClosed
    (And.intro E.dispersionTensorClosed
      (And.intro E.reactionKineticsClosed E.sourceSinkTermClosed))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse