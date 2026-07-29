import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure ChainRulePackage {X : Type u} [NormedAddCommGroup X] {Y : Type v} [NormedAddCommGroup Y]
    {Z : Type w} [NormedAddCommGroup Z] where
  f : X → Y
  g : Y → Z
  fFrechetDifferentiableAt (x : X) : Prop
  gFrechetDifferentiableAt (y : Y) : Prop
  compositionDerivativeAt (x : X) : X →L[ℝ] Z
  chainRuleHolds : ∀ (x : X), fFrechetDifferentiableAt x ∧ gFrechetDifferentiableAt (f x) →
    compositionDerivativeAt x = (gFrechetDifferentiableAt (f x)).derivative.comp (fFrechetDifferentiableAt x).derivative

structure ChainRuleEvidence {X : Type u} [NormedAddCommGroup X] {Y : Type v} [NormedAddCommGroup Y]
    {Z : Type w} [NormedAddCommGroup Z] (C : ChainRulePackage X Y Z) where
  chainRuleHoldsClosed : ∀ (x : X), (C.fFrechetDifferentiableAt x ∧ C.gFrechetDifferentiableAt (C.f x)) →
    C.compositionDerivativeAt x = (C.gFrechetDifferentiableAt (C.f x)).derivative.comp (C.fFrechetDifferentiableAt x).derivative

def ChainRuleClosed {X : Type u} [NormedAddCommGroup X] {Y : Type v} [NormedAddCommGroup Y]
    {Z : Type w} [NormedAddCommGroup Z] (C : ChainRulePackage X Y Z) : Prop :=
  ∀ (x : X), (C.fFrechetDifferentiableAt x ∧ C.gFrechetDifferentiableAt (C.f x)) →
    C.compositionDerivativeAt x = (C.gFrechetDifferentiableAt (C.f x)).derivative.comp (C.fFrechetDifferentiableAt x).derivative

theorem chain_rule_closed_from_evidence {X : Type u} [NormedAddCommGroup X]
    {Y : Type v} [NormedAddCommGroup Y] {Z : Type w} [NormedAddCommGroup Z]
    (C : ChainRulePackage X Y Z) (E : ChainRuleEvidence C) : ChainRuleClosed C := by
  exact E.chainRuleHoldsClosed

end HautevilleHouse.DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse