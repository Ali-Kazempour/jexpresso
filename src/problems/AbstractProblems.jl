abstract type AbstractProblem end

struct Wave1D <: AbstractProblem end
struct AdvDiff <: AbstractProblem end
struct LinearCLaw <: AbstractProblem end
struct Burgers <: AbstractProblem end
struct SW <: AbstractProblem end
struct Elliptic <: AbstractProblem end
struct Helmholtz <: AbstractProblem end
struct LevelSet <: AbstractProblem end
struct ShallowWater <: AbstractProblem end
struct Euler <: AbstractProblem end
struct Redist <: AbstractProblem end