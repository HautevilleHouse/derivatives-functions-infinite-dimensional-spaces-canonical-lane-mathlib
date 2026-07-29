import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure MeanValueInequalityPackage {X : Type u} [NormedAddCommGroup X] {Y : Type v} [NormedAddCommGroup Y]
    (f : X → Y) (a b : X) where
  segment : Set X := {x | ∃ (t : ℝ), 0 ≤ t ∧ t ≤ 1 ∧ x = a + t • (b - a)}
  differentiableOnSegment : DifferentiableOn ℝ f segment
  boundOnDerivative : ℝ
  inequalityHolds : ‖f b - f a‖ ≤ boundOnDerivative * ‖b - a‖

structure MeanValueInequalityEvidence {X : Type u} [NormedAddCommGroup X] {Y : Type v} [NormedAddCommGroup Y]
    {f : X → Y} {a b : X} (M : MeanValueInequalityPackage X Y f a b) where
  differentiableOnSegmentClosed : M.differentiableOnSegment
  boundOnDerivativeClosed : M.boundOnDerivative
  inequalityHoldsClosed : M.inequalityHolds

def MeanValueInequalityClosed {X : Type u} [NormedAddCommGroup X] {Y : Type v} [NormedAddCommGroup Y]
    {f : X → Y} {a b : X} (M : MeanValueInequalityPackage X Y f a b) : Prop :=
  M.differentiableOnSegment ∧ M.boundOnDerivative ∧ M.inequalityHolds

theorem mean_value_inequality_closed_from_evidence {X : Type u} [NormedAddCommGroup X]
    {Y : Type v} [NormedAddCommGroup Y] {f : X → Y} {a b : X}
    (M : MeanValueInequalityPackage X Y f a b) (E : MeanValueInequalityEvidence M) :
    MeanValueInequalityClosed M := by
  exact And.intro E.differentiableOnSegmentClosed
    (And.intro E.boundOnDerivativeClosed E.inequalityHoldsClosed)

end HautevilleHouse.DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse