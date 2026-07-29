import DenumerableSeparableStructuresCanonicalLaneLean.DenumerableSeparableStructures

/-!
# Density Lemmas for Separable Spaces
-/

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

theorem countable_dense_subset_exists_in_separable_metric
    (X : Type u) [MetricSpace X] [SeparableSpace X] :
    ∃ (S : Set X), Set.Countable S ∧ Dense S := by
  exact exists_countable_dense X

theorem countable_covering_by_balls
    (X : Type u) [MetricSpace X] [SeparableSpace X] (ε : ℝ) (hε : 0 < ε) :
    ∃ (C : Set X), Set.Countable C ∧ X = ⋃ x ∈ C, Metric.ball x ε := by
  have h : SeparableSpace X := inferInstance
  rcases h with ⟨S, hS, hS_dense⟩
  refine ⟨S, hS, ?_⟩
  ext x
  constructor
  · intro hx; exact hx
  · intro hx
    have : x ∈ closure S := hS_dense x
    rcases Metric.mem_closure_iff.mp this (ε / 2) (by linarith) with ⟨y, hy, hyx⟩
    have : x ∈ Metric.ball y ε := by
      rw [Metric.mem_ball, dist_comm]
      exact hyx
    exact Set.mem_biUnion hy (by exact this)

theorem separable_subset_dense (X : Type u) [TopologicalSpace X] [SeparableSpace X] :
    ∃ (S : Set X), Set.Countable S ∧ Dense S := by
  exact exists_countable_dense X

theorem dense_iff_forall_nonempty_open_inter (X : Type u) [TopologicalSpace X] (S : Set X) :
    Dense S ↔ ∀ (U : Set X), IsOpen U → U.Nonempty → (S ∩ U).Nonempty := by
  exact dense_iff_inter_open

theorem closure_of_dense_eq_univ (X : Type u) [TopologicalSpace X] (S : Set X) (hS : Dense S) :
    closure S = Set.univ := by
  exact hS.closure_eq

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse