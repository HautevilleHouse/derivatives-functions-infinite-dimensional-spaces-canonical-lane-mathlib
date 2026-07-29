import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure BanachSpaceDerivativePackage where
  domainBanach : Type u
  codomainBanach : Type v
  normedDomain : NormedAddCommGroup domainBanach
  completeDomain : CompleteSpace domainBanach
  normedCodomain : NormedAddCommGroup codomainBanach
  completeCodomain : CompleteSpace codomainBanach
  functionSpace : domainBanach → codomainBanach
  frechetDerivative : domainBanach → (domainBanach →L[ℝ] codomainBanach)
  derivativeDefined : Prop
  linearAndBounded : Prop
  chainRuleHolds : Prop

structure BanachSpaceDerivativeEvidence (B : BanachSpaceDerivativePackage) where
  derivativeDefinedClosed : B.derivativeDefined
  linearAndBoundedClosed : B.linearAndBounded
  chainRuleHoldsClosed : B.chainRuleHolds

def BanachSpaceDerivativeClosed (B : BanachSpaceDerivativePackage) : Prop :=
  B.derivativeDefined ∧ B.linearAndBounded ∧ B.chainRuleHolds

theorem banach_space_derivative_closed_from_evidence (B : BanachSpaceDerivativePackage)
    (E : BanachSpaceDerivativeEvidence B) : BanachSpaceDerivativeClosed B := by
  exact And.intro E.derivativeDefinedClosed
    (And.intro E.linearAndBoundedClosed E.chainRuleHoldsClosed)

end DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse