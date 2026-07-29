import HautevilleHouse.DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean

structure DerivativeAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  dualSpace : Type
  weakTopology : TopologicalSpace dualSpace
  derivativeDefined : Prop
  conclusion : derivativeDefined

def DerivativeWitnessClosed (O : DerivativeAdmittedObject) : Prop :=
  O.derivativeDefined

end DerivativesFunctionsInfiniteDimensionalSpacesCanonicalLaneLean
end HautevilleHouse