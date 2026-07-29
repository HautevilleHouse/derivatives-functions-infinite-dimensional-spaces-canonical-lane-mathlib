import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure NemytskiiOperatorPackage (U V : Type) [NormedAddCommGroup U] [NormedAddCommGroup V]
    (Ω : Type) [MeasureTheory.MeasureSpace Ω] where
  carrier : (Ω → U) → (Ω → V)
  isLocallyLipschitz : Prop
  isContinuouslyFrechetDifferentiable : Prop
  derivativeIsMultiplicationByDerivative : Prop
  isLocallyLipschitzTerm : isLocallyLipschitz
  isContinuouslyFrechetDifferentiableTerm : isContinuouslyFrechetDifferentiable
  derivativeIsMultiplicationByDerivativeTerm : derivativeIsMultiplicationByDerivative

structure NemytskiiOperatorEvidence {U V : Type} [NormedAddCommGroup U] [NormedAddCommGroup V]
    {Ω : Type} [MeasureTheory.MeasureSpace Ω]
    (N : NemytskiiOperatorPackage U V Ω) where
  isLocallyLipschitzClosed : N.isLocallyLipschitz
  isContinuouslyFrechetDifferentiableClosed : N.isContinuouslyFrechetDifferentiable
  derivativeIsMultiplicationByDerivativeClosed : N.derivativeIsMultiplicationByDerivative

def NemytskiiOperatorClosed {U V : Type} [NormedAddCommGroup U] [NormedAddCommGroup V]
    {Ω : Type} [MeasureTheory.MeasureSpace Ω]
    (N : NemytskiiOperatorPackage U V Ω) : Prop :=
  N.isLocallyLipschitz ∧ N.isContinuouslyFrechetDifferentiable ∧ N.derivativeIsMultiplicationByDerivative

theorem nemytskii_operator_closed_from_evidence {U V : Type} [NormedAddCommGroup U] [NormedAddCommGroup V]
    {Ω : Type} [MeasureTheory.MeasureSpace Ω]
    (N : NemytskiiOperatorPackage U V Ω) (E : NemytskiiOperatorEvidence N) : NemytskiiOperatorClosed N := by
  exact And.intro E.isLocallyLipschitzClosed (And.intro E.isContinuouslyFrechetDifferentiableClosed E.derivativeIsMultiplicationByDerivativeClosed)

end DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse