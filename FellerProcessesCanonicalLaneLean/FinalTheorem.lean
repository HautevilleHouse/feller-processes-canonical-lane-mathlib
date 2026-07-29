import canonicalLaneMathlib.AdmissibleClass
import FellerProcessesCanonicalLaneLean.BridgeLemmas
import FellerProcessesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace FellerProcessesCanonicalLaneLean

def ConstrainedFellerClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_feller_endgame (A : AdmissibleClass) :
    ConstrainedFellerClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FellerProcessesCanonicalLaneLean
end HautevilleHouse