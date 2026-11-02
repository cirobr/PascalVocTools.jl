using PascalVocTools; pv=PascalVocTools
using Test

@testset "PascalVocTools.jl" begin
    @test pv.classnumber2classname(0) == "background"
    @test pv.classname2classnumber("background") == 0
    @test pv.classnumber2classname(10) == "cow"
    @test pv.classname2classnumber("cow") == 10
    @test pv.classnumber2classname(255) == "void"
    @test pv.classname2classnumber("void") == 255
    @test pv.classnumber2classname(100) == "void"
    @test pv.classname2classnumber("unknown_class") == 255
end