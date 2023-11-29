using PascalVocTools
using Test

@testset "PascalVocTools.jl" begin
    @test voc_classnumber2classname[10] == "cow"
    @test voc_classname2classnumber["cow"] == 10
    @test voc_colormap2classnumber[[64, 128, 0]] == 10
    @test voc_classnumber2colormap[10] == [64, 128, 0]
end
