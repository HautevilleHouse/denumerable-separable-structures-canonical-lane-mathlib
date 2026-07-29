import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure EmbeddingInProductPackage where
  productSpace : Type
  productTopology : TopologicalSpace productSpace
  countablyManyFactors : Prop
  embeddingContinuous : Prop
  embeddingInjective : Prop
  embeddingHomeomorphicToImage : Prop

structure EmbeddingInProductEvidence (E : EmbeddingInProductPackage) where
  countablyManyFactorsClosed : E.countablyManyFactors
  embeddingContinuousClosed : E.embeddingContinuous
  embeddingInjectiveClosed : E.embeddingInjective
  embeddingHomeomorphicToImageClosed : E.embeddingHomeomorphicToImage

def EmbeddingInProductClosed (E : EmbeddingInProductPackage) : Prop :=
  E.countablyManyFactors ∧ E.embeddingContinuous ∧ E.embeddingInjective ∧ E.embeddingHomeomorphicToImage

theorem embedding_in_product_closed_from_evidence (E : EmbeddingInProductPackage) (Ev : EmbeddingInProductEvidence E) :
    EmbeddingInProductClosed E := by
  exact And.intro Ev.countablyManyFactorsClosed (And.intro Ev.embeddingContinuousClosed (And.intro Ev.embeddingInjectiveClosed Ev.embeddingHomeomorphicToImageClosed))

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse