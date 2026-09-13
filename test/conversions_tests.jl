@test pvt.classnumber2classname(10) == "cow"
@test pvt.classnumber2classname(30) == "void"  # 30 is not a valid class

@test pvt.classname2classnumber("cow") == 10
@test pvt.classname2classnumber("unknown") == 255  # "unknown" is not a valid class
