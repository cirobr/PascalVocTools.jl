using PascalVocTools; pvt=PascalVocTools
using Test

@testset "PascalVocTools.jl" begin
    @test pvt.classnumber2classname(0) == "background"
    @test pvt.classname2classnumber("background") == 0
    @test pvt.classnumber2classname(255) == "void"
    @test pvt.classname2classnumber("void") == 255
    @test pvt.classnumber2classname(10) == "cow"
    @test pvt.classname2classnumber("cow") == 10
end