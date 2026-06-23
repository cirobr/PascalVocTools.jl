@test classnumber2classname(10) == "cow"
@test classnumber2classname(30) == "void"  # 30 is not a valid class

@test classname2classnumber("cow") == 10
@test classname2classnumber("unknown") == 255  # "unknown" is not a valid class
