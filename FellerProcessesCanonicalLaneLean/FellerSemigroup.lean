import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FellerProcessesCanonicalLaneLean

structure FellerSemigroupPackage (X : Type u) [TopologicalSpace X] where
  transition : X → Set (X → ℝ) → ℝ
  markovProperty : Prop
  strongMarkovProperty : Prop
  fellerProperty : Prop
  semigroupProperty : Prop
  positivityCondition : Prop

structure FellerSemigroupEvidence {X : Type u} [TopologicalSpace X] (F : FellerSemigroupPackage X) where
  markovPropertyClosed : F.markovProperty
  strongMarkovPropertyClosed : F.strongMarkovProperty
  fellerPropertyClosed : F.fellerProperty
  semigroupPropertyClosed : F.semigroupProperty
  positivityConditionClosed : F.positivityCondition

def FellerSemigroupClosed {X : Type u} [TopologicalSpace X] (F : FellerSemigroupPackage X) : Prop :=
  F.markovProperty ∧ F.strongMarkovProperty ∧ F.fellerProperty ∧ F.semigroupProperty ∧ F.positivityCondition

theorem feller_semigroup_closed_from_evidence {X : Type u} [TopologicalSpace X]
    (F : FellerSemigroupPackage X) (E : FellerSemigroupEvidence F) : FellerSemigroupClosed F :=
  And.intro E.markovPropertyClosed
    (And.intro E.strongMarkovPropertyClosed
      (And.intro E.fellerPropertyClosed
        (And.intro E.semigroupPropertyClosed E.positivityConditionClosed)))

end FellerProcessesCanonicalLaneLean
end HautevilleHouse