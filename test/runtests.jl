using PascalVocTools
using Images
using Test

@testset "PascalVocTools.jl" begin
    include("./conversions_tests.jl")
    include("./rgb2classes_test.jl")
end
