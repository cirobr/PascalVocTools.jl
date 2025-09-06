using Pkg
envpath = expanduser("~/envs/dev/")
Pkg.activate(envpath)
using PascalVocTools; pv=PascalVocTools

path = expanduser("~/datasets/pascalvoc/")
pv.voc_download(path)
