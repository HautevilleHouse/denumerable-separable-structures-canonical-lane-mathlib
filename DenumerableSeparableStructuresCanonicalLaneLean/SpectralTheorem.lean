import DenumerableSeparableStructuresCanonicalLaneLean.DenumerableSeparableStructures

/-!
# Spectral Theorem for Compact Self-Adjoint Operators
-/

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure CompactSelfAdjointOperator (H : HilbertSpace) where
  operator : H.carrier → H.carrier
  linear : ∀ (x y : H.carrier) (a : ℝ), operator (H.addition (H.multiplication a x) y) = H.addition (H.multiplication a (operator x)) (operator y)
  selfAdjoint : ∀ (x y : H.carrier), H.innerProduct (operator x) y = H.innerProduct x (operator y)
  compact : ∀ (bounded : Set H.carrier) (hbounded : Metric.Bounded bounded), IsCompact (closure (operator '' bounded))

structure SpectralDecomposition (H : HilbertSpace) (T : CompactSelfAdjointOperator H) where
  eigenvalues : Set ℝ
  eigenvectors : ℝ → Set H.carrier
  orthonormalBasis : Set H.carrier
  orthonormal : Orthonormal ℝ (fun (v : orthonormalBasis) => v)
  completeSpan : Dense (Submodule.span ℝ orthonormalBasis)
  eigenpair : ∀ (v : orthonormalBasis), ∃ (λ : ℝ), T.operator v = H.multiplication λ v
  eigenvalueCountable : Set.Countable eigenvalues
  limitPointZero : eigenvalues.AccumulationPoint 0

structure SpectralTheoremEvidence (H : HilbertSpace) (T : CompactSelfAdjointOperator H) where
  existsSpectralDecomposition : Nonempty (SpectralDecomposition H T)
  uniquenessOfEigenvalues : ∀ (sd₁ sd₂ : SpectralDecomposition H T), sd₁.eigenvalues = sd₂.eigenvalues

def SpectralTheoremClosed (H : HilbertSpace) (T : CompactSelfAdjointOperator H) : Prop :=
  Nonempty (SpectralTheoremEvidence H T)

theorem spectral_theorem_closed (H : HilbertSpace) (T : CompactSelfAdjointOperator H) :
    SpectralTheoremClosed H T := by
  sorry

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse