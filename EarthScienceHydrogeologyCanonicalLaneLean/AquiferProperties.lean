import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

structure AquiferPropertiesPackage where
  porosity : Prop
  hydraulicConductivity : Prop
  storativity : Prop
  transmissivity : Prop
  heterogeneity : Prop
  anisotropy : Prop

structure AquiferPropertiesEvidence (A : AquiferPropertiesPackage) where
  porosityClosed : A.porosity
  hydraulicConductivityClosed : A.hydraulicConductivity
  storativityClosed : A.storativity
  transmissivityClosed : A.transmissivity
  heterogeneityClosed : A.heterogeneity
  anisotropyClosed : A.anisotropy

def AquiferPropertiesClosed (A : AquiferPropertiesPackage) : Prop :=
  A.porosity ∧ A.hydraulicConductivity ∧ A.storativity ∧
  A.transmissivity ∧ A.heterogeneity ∧ A.anisotropy

theorem aquifer_properties_closed_from_evidence (A : AquiferPropertiesPackage) (E : AquiferPropertiesEvidence A) :
    AquiferPropertiesClosed A := by
  exact And.intro E.porosityClosed
    (And.intro E.hydraulicConductivityClosed
      (And.intro E.storativityClosed
        (And.intro E.transmissivityClosed
          (And.intro E.heterogeneityClosed E.anisotropyClosed))))

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse