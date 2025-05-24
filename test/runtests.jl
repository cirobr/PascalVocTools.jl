using PascalVocTools
using Test

@testset "PascalVocTools.jl" begin
    @test voc_classnumbers[10] == "cow"
    @test voc_classnames["cow"] == 10
    @test voc_colormaps2classnumbers[[64, 128, 0]] == 10
    @test voc_classnumbers2colormaps[10] == [64, 128, 0]
end
