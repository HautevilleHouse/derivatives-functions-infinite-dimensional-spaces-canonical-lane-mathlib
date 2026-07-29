import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure NashMoserPackage where
  frechetSpaces : Type u × Type v
  tameEstimates : Prop
  smoothingOperators : Prop
  inverseFunctionExists : Prop
  lossOfDerivativesHandled : Prop

structure NashMoserEvidence (N : NashMoserPackage) where
  tameEstimatesClosed : N.tameEstimates
  smoothingOperatorsClosed : N.smoothingOperators
  inverseFunctionExistsClosed : N.inverseFunctionExists
  lossOfDerivativesHandledClosed : N.lossOfDerivativesHandled

def NashMoserClosed (N : NashMoserPackage) : Prop :=
  N.tameEstimates ∧ N.smoothingOperators ∧ N.inverseFunctionExists ∧ N.lossOfDerivativesHandled

theorem nash_moser_closed_from_evidence
    (N : NashMoserPackage) (E : NashMoserEvidence N) :
    NashMoserClosed N := by
  exact And.intro E.tameEstimatesClosed
    (And.intro E.smoothingOperatorsClosed
      (And.intro E.inverseFunctionExistsClosed E.lossOfDerivativesHandledClosed))

end DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse