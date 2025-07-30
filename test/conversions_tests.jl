@test voc_classnumbers(10) == "cow"
@test voc_classnumbers(30) == "background"  # 30 is not a valid class, should return background

@test voc_classnames("cow") == 10
@test voc_classnames("unknown") == 0  # "unknown" is not a valid class, should return background

@test voc_colormaps2classnumbers([64, 128, 0]) == 10
@test voc_colormaps2classnumbers([255, 255, 255]) == 0  # [255, 255, 255] is not a valid colormap

@test voc_classnumbers2colormaps(10) == [64, 128, 0]
@test voc_classnumbers2colormaps(30) == [0, 0, 0]  # 30 is not a valid class, should return background
