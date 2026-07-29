import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DenumerableSeparableStructuresCanonicalLaneLean

structure CantorBendixsonRank where
  space : Type u
  topology : TopologicalSpace space
  separable : Prop
  denumerable : Prop
  cbRank : Ordinal
  perfectKernel : Set space
  scatteredPart : Set space
  kernelClosed : IsClosed perfectKernel
  kernelPerfect : PerfectSet perfectKernel
  scatteredIsScattered : IsScattered scatteredPart
  rankBoundFromDenumerable : cbRank < ω₁

structure CantorBendixsonEvidence (C : CantorBendixsonRank) where
  separableClosed : C.separable
  denumerableClosed : C.denumerable
  kernelClosedClosed : C.kernelClosed
  kernelPerfectClosed : C.kernelPerfect
  scatteredIsScatteredClosed : C.scatteredIsScattered
  rankBoundClosed : C.rankBoundFromDenumerable

def CantorBendixsonClosed (C : CantorBendixsonRank) : Prop :=
  C.separable ∧ C.denumerable ∧ C.kernelClosed ∧ C.kernelPerfect ∧ C.scatteredIsScattered ∧ C.rankBoundFromDenumerable

theorem cantor_bendixson_closed_from_evidence (C : CantorBendixsonRank) (E : CantorBendixsonEvidence C) : CantorBendixsonClosed C := by
  exact And.intro E.separableClosed
    (And.intro E.denumerableClosed
      (And.intro E.kernelClosedClosed
        (And.intro E.kernelPerfectClosed
          (And.intro E.scatteredIsScatteredClosed E.rankBoundClosed))))

end DenumerableSeparableStructuresCanonicalLaneLean
end HautevilleHouse
