import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FellerProcessesCanonicalLaneLean

structure GeneratorDomainPackage {X : Type u} [TopologicalSpace X]
    (F : FellerSemigroupPackage X) where
  domain : Set (X → ℝ)
  generatorDefined : Prop
  domainDense : Prop
  coreProperty : Prop

structure GeneratorDomainEvidence {X : Type u} [TopologicalSpace X]
    {F : FellerSemigroupPackage X} (G : GeneratorDomainPackage F) where
  generatorDefinedClosed : G.generatorDefined
  domainDenseClosed : G.domainDense
  corePropertyClosed : G.coreProperty

def GeneratorDomainClosed {X : Type u} [TopologicalSpace X]
    {F : FellerSemigroupPackage X} (G : GeneratorDomainPackage F) : Prop :=
  G.generatorDefined ∧ G.domainDense ∧ G.coreProperty

theorem generator_domain_closed_from_evidence {X : Type u} [TopologicalSpace X]
    {F : FellerSemigroupPackage X} (G : GeneratorDomainPackage F)
    (E : GeneratorDomainEvidence G) : GeneratorDomainClosed G :=
  And.intro E.generatorDefinedClosed
    (And.intro E.domainDenseClosed E.corePropertyClosed)

end FellerProcessesCanonicalLaneLean
end HautevilleHouse