import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FellerProcessesCanonicalLaneLean

structure MartingaleProblemPackage {X : Type u} [TopologicalSpace X]
    (F : FellerSemigroupPackage X) (G : GeneratorDomainPackage F) where
  processSpace : Type v
  filtration : Type w
  adaptedProcess : Prop
  martingaleProperty : Prop
  rcllPaths : Prop

structure MartingaleProblemEvidence {X : Type u} [TopologicalSpace X]
    {F : FellerSemigroupPackage X} {G : GeneratorDomainPackage F}
    (M : MartingaleProblemPackage F G) where
  adaptedProcessClosed : M.adaptedProcess
  martingalePropertyClosed : M.martingaleProperty
  rcllPathsClosed : M.rcllPaths

def MartingaleProblemClosed {X : Type u} [TopologicalSpace X]
    {F : FellerSemigroupPackage X} {G : GeneratorDomainPackage F}
    (M : MartingaleProblemPackage F G) : Prop :=
  M.adaptedProcess ∧ M.martingaleProperty ∧ M.rcllPaths

theorem martingale_problem_closed_from_evidence {X : Type u} [TopologicalSpace X]
    {F : FellerSemigroupPackage X} {G : GeneratorDomainPackage F}
    (M : MartingaleProblemPackage F G) (E : MartingaleProblemEvidence M) :
    MartingaleProblemClosed M :=
  And.intro E.adaptedProcessClosed
    (And.intro E.martingalePropertyClosed E.rcllPathsClosed)

end FellerProcessesCanonicalLaneLean
end HautevilleHouse