import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure GaussianMeasurePackage (X : Type) [NormedAddCommGroup X] [SeparableSpace X] where
  mean : X
  covariance : X → Dual X → ℝ
  isSymmetric : Prop
  isPositiveSemidefinite : Prop
  isCovariance : Prop
  isCovarianceTerm : isCovariance

structure GaussianMeasureEvidence {X : Type} [NormedAddCommGroup X] [SeparableSpace X]
    (G : GaussianMeasurePackage X) where
  isSymmetricClosed : G.isSymmetric
  isPositiveSemidefiniteClosed : G.isPositiveSemidefinite
  isCovarianceClosed : G.isCovariance

def GaussianMeasureClosed {X : Type} [NormedAddCommGroup X] [SeparableSpace X]
    (G : GaussianMeasurePackage X) : Prop :=
  G.isSymmetric ∧ G.isPositiveSemidefinite ∧ G.isCovariance

theorem gaussian_measure_closed_from_evidence {X : Type} [NormedAddCommGroup X] [SeparableSpace X]
    (G : GaussianMeasurePackage X) (E : GaussianMeasureEvidence G) : GaussianMeasureClosed G := by
  exact And.intro E.isSymmetricClosed (And.intro E.isPositiveSemidefiniteClosed E.isCovarianceClosed)

end DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse