import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FellerProcessesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FellerProcessWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FellerProcessesCanonicalLaneLean
end HautevilleHouse