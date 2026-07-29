import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure MalliavinDerivativePackage (H : Type) [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    (Ω : Type) [MeasureTheory.MeasureSpace Ω] where
  isAbstractWienerSpace : Prop
  malliavinDerivative : (Ω → ℝ) → (Ω → H)
  closability : Prop
  integrationByParts : Prop
  isAbstractWienerSpaceTerm : isAbstractWienerSpace
  closabilityTerm : closability
  integrationByPartsTerm : integrationByParts

structure MalliavinDerivativeEvidence {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    {Ω : Type} [MeasureTheory.MeasureSpace Ω]
    (M : MalliavinDerivativePackage H Ω) where
  isAbstractWienerSpaceClosed : M.isAbstractWienerSpace
  closabilityClosed : M.closability
  integrationByPartsClosed : M.integrationByParts

def MalliavinDerivativeClosed {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    {Ω : Type} [MeasureTheory.MeasureSpace Ω]
    (M : MalliavinDerivativePackage H Ω) : Prop :=
  M.isAbstractWienerSpace ∧ M.closability ∧ M.integrationByParts

theorem malliavin_derivative_closed_from_evidence {H : Type} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    {Ω : Type} [MeasureTheory.MeasureSpace Ω]
    (M : MalliavinDerivativePackage H Ω) (E : MalliavinDerivativeEvidence M) : MalliavinDerivativeClosed M := by
  exact And.intro E.isAbstractWienerSpaceClosed (And.intro E.closabilityClosed E.integrationByPartsClosed)

end DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse