import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FellerProcessesCanonicalLaneLean

structure FellerProcessAdmittedObject where
  stateSpace : Type u
  topology : TopologicalSpace stateSpace
  fellerSemigroup : stateSpace → stateSpace → ℝ → ℝ
  markovProperty : Prop
  fellerProperty : Prop
  strongContinuity : Prop
  conclusion : fellerProperty ∧ strongContinuity

structure AdmissibleClass where
  object : FellerProcessAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FellerProcessWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def FellerProcessWitnessClosed (O : FellerProcessAdmittedObject) : Prop :=
  O.fellerProperty ∧ O.strongContinuity

end FellerProcessesCanonicalLaneLean
end HautevilleHouse