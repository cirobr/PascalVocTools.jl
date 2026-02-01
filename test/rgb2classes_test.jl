x1 = (128, 0, 0) ./ 255f0        # 1
x1 = Images.RGB{N0f8}(x1...)
x2 = (0, 128, 0) ./ 255f0        # 2
x2 = Images.RGB{N0f8}(x2...)
x3 = (128, 128, 0) ./ 255f0      # 3
x3 = Images.RGB{N0f8}(x3...)
x4 = (0, 0, 128) ./ 255f0        # 4
x4 = Images.RGB{N0f8}(x4...)

v=[x1,x2,x3,x4]
m = reshape(v, 2, 2)

@test voc_rgb2classes(m) == reshape([1, 2, 3, 4], 2, 2)