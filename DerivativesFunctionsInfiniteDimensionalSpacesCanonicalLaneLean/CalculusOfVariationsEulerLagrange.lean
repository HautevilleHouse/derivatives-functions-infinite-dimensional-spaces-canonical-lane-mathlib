import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure EulerLagrangePackage where
  functionSpace : Type u
  lagrangian : functionSpace → ℝ
  criticalPoints : functionSpace → Prop
  eulerLagrangeEquationHolds : Prop
  weakSolutionsDefined : Prop

structure EulerLagrangeEvidence (E : EulerLagrangePackage) where
  eulerLagrangeEquationHoldsClosed : E.eulerLagrangeEquationHolds
  weakSolutionsDefinedClosed : E.weakSolutionsDefined

def EulerLagrangeClosed (E : EulerLagrangePackage) : Prop :=
  E.eulerLagrangeEquationHolds ∧ E.weakSolutionsDefined

theorem euler_lagrange_closed_from_evidence
    (E : EulerLagrangePackage) (Ev : EulerLagrangeEvidence E) :
    EulerLagrangeClosed E := by
  exact And.intro Ev.eulerLagrangeEquationHoldsClosed Ev.weakSolutionsDefinedClosed

end DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse