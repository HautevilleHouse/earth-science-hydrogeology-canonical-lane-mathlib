import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceHydrogeologyCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  HydrogeologyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EarthScienceHydrogeologyCanonicalLaneLean
end HautevilleHouse