import HautevilleHouse.DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean.GateauxDerivative

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure InverseFunctionTheoremPackage {F : FrechetDifferentiabilityPackage}
    {G : GateauxDerivativePackage F} where
  point : F.domain
  derivativeInvertible : (F.derivativeAtPoint F.point) ≃L[ℝ] F.codomain
  localInverse : F.codomain → F.domain
  inverseDifferentiable : Prop
  localInversionFormula : Prop

structure InverseFunctionTheoremEvidence {F : FrechetDifferentiabilityPackage}
    {G : GateauxDerivativePackage F} (I : InverseFunctionTheoremPackage F G) where
  inverseDifferentiableClosed : I.inverseDifferentiable
  localInversionFormulaClosed : I.localInversionFormula

def InverseFunctionTheoremClosed {F : FrechetDifferentiabilityPackage}
    {G : GateauxDerivativePackage F} (I : InverseFunctionTheoremPackage F G) : Prop :=
  I.inverseDifferentiable ∧ I.localInversionFormula

theorem inverse_function_theorem_closed_from_evidence
    {F : FrechetDifferentiabilityPackage} {G : GateauxDerivativePackage F}
    (I : InverseFunctionTheoremPackage F G) (E : InverseFunctionTheoremEvidence I) :
    InverseFunctionTheoremClosed I :=
  And.intro E.inverseDifferentiableClosed E.localInversionFormulaClosed

end DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse