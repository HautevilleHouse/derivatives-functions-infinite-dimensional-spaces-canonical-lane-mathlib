import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure FrechetDerivativePackage (X : Type u) [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] (Y : Type v) [TopologicalSpace Y] [AddCommGroup Y] [Module ℝ Y] where
  f : X → Y
  x0 : X
  derivative : X → Y
  boundedLinear : IsBoundedLinearMap ℝ derivative
  limitExists : Prop

structure FrechetDerivativeEvidence {X : Type u} [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] {Y : Type v} [TopologicalSpace Y] [AddCommGroup Y] [Module ℝ Y] (F : FrechetDerivativePackage X Y) where
  boundedLinearClosed : F.boundedLinear
  limitExistsClosed : F.limitExists

def FrechetDerivativeClosed {X : Type u} [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] {Y : Type v} [TopologicalSpace Y] [AddCommGroup Y] [Module ℝ Y] (F : FrechetDerivativePackage X Y) : Prop :=
  F.boundedLinear ∧ F.limitExists

theorem frechet_derivative_closed_from_evidence {X : Type u} [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] {Y : Type v} [TopologicalSpace Y] [AddCommGroup Y] [Module ℝ Y] (F : FrechetDerivativePackage X Y) (E : FrechetDerivativeEvidence F) : FrechetDerivativeClosed F := by
  exact And.intro E.boundedLinearClosed E.limitExistsClosed

end DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse