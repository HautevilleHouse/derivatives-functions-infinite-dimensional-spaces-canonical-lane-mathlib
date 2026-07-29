import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure FrechetDerivativePackage where
  sourceBanachSpace : Type u
  targetBanachSpace : Type v
  point : sourceBanachSpace
  linearMap : sourceBanachSpace → targetBanachSpace
  derivativeDefined : Prop
  boundedLinear : Prop
  limitCondition : Prop

structure FrechetDerivativeEvidence (F : FrechetDerivativePackage) where
  derivativeDefinedClosed : F.derivativeDefined
  boundedLinearClosed : F.boundedLinear
  limitConditionClosed : F.limitCondition

def FrechetDerivativeClosed (F : FrechetDerivativePackage) : Prop :=
  F.derivativeDefined ∧ F.boundedLinear ∧ F.limitCondition

theorem frechet_derivative_closed_from_evidence
    (F : FrechetDerivativePackage) (E : FrechetDerivativeEvidence F) :
    FrechetDerivativeClosed F := by
  exact And.intro E.derivativeDefinedClosed
    (And.intro E.boundedLinearClosed E.limitConditionClosed)

end DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse