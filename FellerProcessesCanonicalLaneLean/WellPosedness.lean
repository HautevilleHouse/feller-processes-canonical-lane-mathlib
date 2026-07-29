import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FellerProcessesCanonicalLaneLean

structure WellPosednessPackage {X : Type u} [TopologicalSpace X]
    (F : FellerSemigroupPackage X) (G : GeneratorDomainPackage F)
    (M : MartingaleProblemPackage F G) where
  existence : Prop
  uniqueness : Prop
  markovPropertyHolds : Prop
  continuityProperty : Prop

structure WellPosednessEvidence {X : Type u} [TopologicalSpace X]
    {F : FellerSemigroupPackage X} {G : GeneratorDomainPackage F}
    {M : MartingaleProblemPackage F G} (W : WellPosednessPackage F G M) where
  existenceClosed : W.existence
  uniquenessClosed : W.uniqueness
  markovPropertyHoldsClosed : W.markovPropertyHolds
  continuityPropertyClosed : W.continuityProperty

def WellPosednessClosed {X : Type u} [TopologicalSpace X]
    {F : FellerSemigroupPackage X} {G : GeneratorDomainPackage F}
    {M : MartingaleProblemPackage F G} (W : WellPosednessPackage F G M) : Prop :=
  W.existence ∧ W.uniqueness ∧ W.markovPropertyHolds ∧ W.continuityProperty

theorem well_posedness_closed_from_evidence {X : Type u} [TopologicalSpace X]
    {F : FellerSemigroupPackage X} {G : GeneratorDomainPackage F}
    {M : MartingaleProblemPackage F G} (W : WellPosednessPackage F G M)
    (E : WellPosednessEvidence W) : WellPosednessClosed W :=
  And.intro E.existenceClosed
    (And.intro E.uniquenessClosed
      (And.intro E.markovPropertyHoldsClosed E.continuityPropertyClosed))

end FellerProcessesCanonicalLaneLean
end HautevilleHouse