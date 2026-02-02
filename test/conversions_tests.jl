@test voc_classnumber2classname(10) == "cow"
@test voc_classnumber2classname(30) == "void"  # 30 is not a valid class, should return void

@test voc_classname2classnumber("cow") == 10
@test voc_classname2classnumber("unknown") == 255  # "unknown" is not a valid class, should return 255 (void)

@test voc_colormap2classnumber((64, 128, 0)) == 10
@test voc_colormap2classnumber((20, 30, 40)) == 255  # (20, 30, 40) is not a valid colormap, should return 255 (void)

@test voc_classnumber2colormap(10) == (64, 128, 0)
@test voc_classnumber2colormap(30) == (224, 224, 192)  # 30 is not a valid class, should return void color

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
