import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean.GaussianMeasures
import HautevilleHouse.DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean.FrechetDifferentiability
import HautevilleHouse.DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean.NemytskiiOperator
import HautevilleHouse.DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean.MalliavinDerivative

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GaussianMeasureClosed (A.object) ∧ FrechetDifferentiabilityClosed (A.object) ∧
  NemytskiiOperatorClosed (A.object) ∧ MalliavinDerivativeClosed (A.object)

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

def ConstrainedDerivativesFunctionsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  rcases A.object with ⟨G, F, N, M⟩
  refine And.intro ?_ (And.intro ?_ (And.intro ?_ ?_))
  · exact gaussian_measure_closed_from_evidence G (by sorry)
  · exact frechet_differentiability_closed_from_evidence F (by sorry)
  · exact nemytskii_operator_closed_from_evidence N (by sorry)
  · exact malliavin_derivative_closed_from_evidence M (by sorry)

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

theorem constrained_derivatives_functions_endgame (A : AdmissibleClass) :
    ConstrainedDerivativesFunctionsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse