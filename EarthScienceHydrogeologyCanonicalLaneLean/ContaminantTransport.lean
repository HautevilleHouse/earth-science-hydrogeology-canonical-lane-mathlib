import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure ContaminantTransportPackage where
  advection : Prop
  dispersion : Prop
  retardation : Prop
  decay : Prop
  sorption : Prop
  biologicalTransform : Prop

structure ContaminantTransportEvidence (C : ContaminantTransportPackage) where
  advectionClosed : C.advection
  dispersionClosed : C.dispersion
  retardationClosed : C.retardation
  decayClosed : C.decay
  sorptionClosed : C.sorption
  biologicalTransformClosed : C.biologicalTransform

def ContaminantTransportClosed (C : ContaminantTransportPackage) : Prop :=
  C.advection ∧ C.dispersion ∧ C.retardation ∧
  C.decay ∧ C.sorption ∧ C.biologicalTransform

theorem contaminant_transport_closed_from_evidence (C : ContaminantTransportPackage) (E : ContaminantTransportEvidence C) :
    ContaminantTransportClosed C := by
  exact And.intro E.advectionClosed
    (And.intro E.dispersionClosed
      (And.intro E.retardationClosed
        (And.intro E.decayClosed
          (And.intro E.sorptionClosed E.biologicalTransformClosed))))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse