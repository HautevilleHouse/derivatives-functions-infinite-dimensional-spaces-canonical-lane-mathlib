import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure ImplicitFunctionPackage {X : Type u} [NormedAddCommGroup X] {Y : Type v} [NormedAddCommGroup Y]
    {Z : Type w} [NormedAddCommGroup Z] (f : X × Y → Z) (a : X × Y) where
  fFrechetDifferentiableAtA : FrechetDifferentiableAt ℝ f a
  partialDerivativeYAtAInvertible : IsBoundedLinearMap (λ y' => fderiv ℝ f a (0, y'))
  implicitFunctionNeighborhood : Set X
  implicitFunctionDefined : implicitFunctionNeighborhood → Y
  implicitFunctionCondition : ∀ (x : implicitFunctionNeighborhood), f (x, implicitFunctionDefined x) = f a
  implicitFunctionDifferentiable : DifferentiableOn ℝ implicitFunctionDefined implicitFunctionNeighborhood
  implicitDerivativeFormula : ∀ (x : implicitFunctionNeighborhood),
    fderiv ℝ implicitFunctionDefined x = -((fderiv ℝ f (x, implicitFunctionDefined x)).comp (λ h => (h, 0))).comp
      (IsBoundedLinearMap.inverse (λ y' => fderiv ℝ f (x, implicitFunctionDefined x) (0, y')))

structure ImplicitFunctionEvidence {X : Type u} [NormedAddCommGroup X] {Y : Type v} [NormedAddCommGroup Y]
    {Z : Type w} [NormedAddCommGroup Z] {f : X × Y → Z} {a : X × Y}
    (I : ImplicitFunctionPackage X Y Z f a) where
  fFrechetDifferentiableAtAClosed : I.fFrechetDifferentiableAtA
  partialDerivativeYAtAInvertibleClosed : I.partialDerivativeYAtAInvertible
  implicitFunctionDifferentiableClosed : I.implicitFunctionDifferentiable
  implicitDerivativeFormulaClosed : ∀ (x : I.implicitFunctionNeighborhood),
    fderiv ℝ I.implicitFunctionDefined x = -((fderiv ℝ f (x, I.implicitFunctionDefined x)).comp (λ h : X => (h, 0))).comp
      (IsBoundedLinearMap.inverse (λ y' : Y => fderiv ℝ f (x, I.implicitFunctionDefined x) (0, y')))

def ImplicitFunctionClosed {X : Type u} [NormedAddCommGroup X] {Y : Type v} [NormedAddCommGroup Y]
    {Z : Type w} [NormedAddCommGroup Z] {f : X × Y → Z} {a : X × Y}
    (I : ImplicitFunctionPackage X Y Z f a) : Prop :=
  I.fFrechetDifferentiableAtA ∧ I.partialDerivativeYAtAInvertible ∧ I.implicitFunctionDifferentiable ∧
  (∀ (x : I.implicitFunctionNeighborhood),
    fderiv ℝ I.implicitFunctionDefined x = -((fderiv ℝ f (x, I.implicitFunctionDefined x)).comp (λ h : X => (h, 0))).comp
      (IsBoundedLinearMap.inverse (λ y' : Y => fderiv ℝ f (x, I.implicitFunctionDefined x) (0, y'))))

theorem implicit_function_closed_from_evidence {X : Type u} [NormedAddCommGroup X]
    {Y : Type v} [NormedAddCommGroup Y] {Z : Type w} [NormedAddCommGroup Z]
    {f : X × Y → Z} {a : X × Y} (I : ImplicitFunctionPackage X Y Z f a)
    (E : ImplicitFunctionEvidence I) : ImplicitFunctionClosed I := by
  exact And.intro E.fFrechetDifferentiableAtAClosed
    (And.intro E.partialDerivativeYAtAInvertibleClosed
      (And.intro E.implicitFunctionDifferentiableClosed E.implicitDerivativeFormulaClosed))

end HautevilleHouse.DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse