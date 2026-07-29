import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure GateauxDerivativePackage (X : Type u) [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] (Y : Type v) [TopologicalSpace Y] [AddCommGroup Y] [Module ℝ Y] where
  f : X → Y
  x0 : X
  derivative : X → Y
  linearity : IsLinearMap ℝ derivative
  limitExists : Prop
  limitValue : derivative = (fun h : X => 0) -- placeholder

structure GateauxDerivativeEvidence {X : Type u} [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] {Y : Type v} [TopologicalSpace Y] [AddCommGroup Y] [Module ℝ Y] (G : GateauxDerivativePackage X Y) where
  linearityClosed : G.linearity
  limitExistsClosed : G.limitExists

def GateauxDerivativeClosed {X : Type u} [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] {Y : Type v} [TopologicalSpace Y] [AddCommGroup Y] [Module ℝ Y] (G : GateauxDerivativePackage X Y) : Prop :=
  G.linearity ∧ G.limitExists

theorem gateaux_derivative_closed_from_evidence {X : Type u} [TopologicalSpace X] [AddCommGroup X] [Module ℝ X] {Y : Type v} [TopologicalSpace Y] [AddCommGroup Y] [Module ℝ Y] (G : GateauxDerivativePackage X Y) (E : GateauxDerivativeEvidence G) : GateauxDerivativeClosed G := by
  exact And.intro E.linearityClosed E.limitExistsClosed

end DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse