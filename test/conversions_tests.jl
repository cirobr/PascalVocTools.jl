@test voc_classnumbers(10) == "cow"
@test voc_classnumbers(30) == "void"  # 30 is not a valid class, should return void

@test voc_classnames("cow") == 10
@test voc_classnames("unknown") == 255  # "unknown" is not a valid class, should return 255 (void)

@test voc_colormaps2classnumbers((64, 128, 0)) == 10
@test voc_colormaps2classnumbers((20, 30, 40)) == 255  # (20, 30, 40) is not a valid colormap, should return 255 (void)

@test voc_classnumbers2colormaps(10) == (64, 128, 0)
@test voc_classnumbers2colormaps(30) == (224, 224, 192)  # 30 is not a valid class, should return void color

c = (0, 0, 0) ./ 255
c = Images.RGB{N0f8}(c...)
@test voc_colors(0) == c     # class 0

c = (128, 0, 0) ./ 255
c = Images.RGB{N0f8}(c...)
@test voc_colors(1) == c     # class 1

c = (0, 64, 128) ./ 255
c = Images.RGB{N0f8}(c...)
@test voc_colors(20) == c    # class 20

c = (224, 224, 192) ./ 255   # void color
c = Images.RGB{N0f8}(c...)
@test voc_colors(21) == c    # void classes
@test voc_colors(255) == c
