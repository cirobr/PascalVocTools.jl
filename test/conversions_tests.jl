@test voc_classnumbers(10) == "cow"
@test voc_classnumbers(30) == "void"  # 30 is not a valid class, should return ignore

@test voc_classnames("cow") == 10
@test voc_classnames("unknown") == 255  # "unknown" is not a valid class, should return 255 (ignore class)

@test voc_colormaps2classnumbers([64, 128, 0]) == 10
@test voc_colormaps2classnumbers([20, 30, 40]) == 255  # [20, 30, 40] is not a valid colormap, should return 255 (ignore class)

@test voc_classnumbers2colormaps(10) == [64, 128, 0]
@test voc_classnumbers2colormaps(30) == [224, 224, 192]  # 30 is not a valid class, should return void color
