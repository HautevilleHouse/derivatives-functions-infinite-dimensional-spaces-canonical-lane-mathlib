import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure FrechetDifferentiabilityPackage (V W : Type) [NormedAddCommGroup V] [NormedAddCommGroup W] where
  function : V → W
  derivative : V → (V →L[ℝ] W)
  isFrechetDifferentiable : Prop
  derivativeIsLinear : Prop
  derivativeIsBounded : Prop
  limitCondition : Prop
  isFrechetDifferentiableTerm : isFrechetDifferentiable
  derivativeIsLinearTerm : derivativeIsLinear
  derivativeIsBoundedTerm : derivativeIsBounded
  limitConditionTerm : limitCondition

structure FrechetDifferentiabilityEvidence {V W : Type} [NormedAddCommGroup V] [NormedAddCommGroup W]
    (F : FrechetDifferentiabilityPackage V W) where
  isFrechetDifferentiableClosed : F.isFrechetDifferentiable
  derivativeIsLinearClosed : F.derivativeIsLinear
  derivativeIsBoundedClosed : F.derivativeIsBounded
  limitConditionClosed : F.limitCondition

def FrechetDifferentiabilityClosed {V W : Type} [NormedAddCommGroup V] [NormedAddCommGroup W]
    (F : FrechetDifferentiabilityPackage V W) : Prop :=
  F.isFrechetDifferentiable ∧ F.derivativeIsLinear ∧ F.derivativeIsBounded ∧ F.limitCondition

theorem frechet_differentiability_closed_from_evidence {V W : Type} [NormedAddCommGroup V] [NormedAddCommGroup W]
    (F : FrechetDifferentiabilityPackage V W) (E : FrechetDifferentiabilityEvidence F) : FrechetDifferentiabilityClosed F := by
  exact And.intro E.isFrechetDifferentiableClosed
    (And.intro E.derivativeIsLinearClosed (And.intro E.derivativeIsBoundedClosed E.limitConditionClosed))

end DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse