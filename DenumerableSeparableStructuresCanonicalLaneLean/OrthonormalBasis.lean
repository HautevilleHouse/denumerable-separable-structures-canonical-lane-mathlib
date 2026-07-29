import DenumerableSeparableStructuresCanonicalLaneLean.DenumerableSeparableStructures

/-!
# Orthonormal Basis in Separable Hilbert Spaces
-/

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure OrthonormalBasis (H : HilbertSpace) where
  basisSet : Set H.carrier
  orthonormal : Orthonormal ℝ (fun (v : basisSet) => v.1)
  complete : Dense (Submodule.span ℝ basisSet)
  countable : Set.Countable basisSet

theorem orthonormal_basis_exists (H : HilbertSpace) (hsep : H.separable) :
    Nonempty (OrthonormalBasis H) := by
  -- classical Gram-Schmidt on countable dense subset
  have h : SeparableSpace H.carrier := by
    -- need to infer from H.separable
    exact hsep
  rcases exists_countable_dense H.carrier with ⟨S, hS_count, hS_dense⟩
  -- apply Gram-Schmidt to obtain orthonormal basis
  sorry

theorem orthonormal_basis_unique_cardinal (H : HilbertSpace) (hsep : H.separable)
    (b1 b2 : OrthonormalBasis H) : Cardinal.mk b1.basisSet = Cardinal.mk b2.basisSet := by
  sorry

theorem parseval_identity (H : HilbertSpace) (b : OrthonormalBasis H) (x : H.carrier) :
    H.norm x ^ 2 = ∑' v ∈ b.basisSet, (H.innerProduct x v.1) ^ 2 := by
  sorry

theorem fourier_expansion (H : HilbertSpace) (b : OrthonormalBasis H) (x : H.carrier) :
    x = ∑' v ∈ b.basisSet, H.innerProduct x v.1 • v.1 := by
  sorry

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse