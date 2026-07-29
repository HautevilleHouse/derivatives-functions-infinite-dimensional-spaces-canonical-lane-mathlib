import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure GateauxDifferentialPackage {X : Type u} [NormedAddCommGroup X] {Y : Type v} [NormedAddCommGroup Y] where
  domainOpen : Set X
  domainOpenIsOpen : IsOpen domainOpen
  functionDefined : domainOpen → Y
  gateauxDifferentialAtPoint (x : domainOpen) : X → Y
  linearity : ∀ (x : domainOpen), IsLinearMap (gateauxDifferentialAtPoint x)
  continuity : ∀ (x : domainOpen), Continuous (gateauxDifferentialAtPoint x)

structure GateauxDifferentialEvidence {X : Type u} [NormedAddCommGroup X] {Y : Type v} [NormedAddCommGroup Y]
    (G : GateauxDifferentialPackage X Y) where
  domainOpenIsOpenClosed : G.domainOpenIsOpen
  linearityClosed : ∀ (x : G.domainOpen), IsLinearMap (G.gateauxDifferentialAtPoint x)
  continuityClosed : ∀ (x : G.domainOpen), Continuous (G.gateauxDifferentialAtPoint x)

def GateauxDifferentialClosed {X : Type u} [NormedAddCommGroup X] {Y : Type v} [NormedAddCommGroup Y]
    (G : GateauxDifferentialPackage X Y) : Prop :=
  G.domainOpenIsOpen ∧ (∀ (x : G.domainOpen), IsLinearMap (G.gateauxDifferentialAtPoint x)) ∧
  (∀ (x : G.domainOpen), Continuous (G.gateauxDifferentialAtPoint x))

theorem gateaux_differential_closed_from_evidence {X : Type u} [NormedAddCommGroup X]
    {Y : Type v} [NormedAddCommGroup Y] (G : GateauxDifferentialPackage X Y)
    (E : GateauxDifferentialEvidence G) : GateauxDifferentialClosed G := by
  exact And.intro E.domainOpenIsOpenClosed (And.intro E.linearityClosed E.continuityClosed)

end HautevilleHouse.DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse