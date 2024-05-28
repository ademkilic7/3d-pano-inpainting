#!/bin/sh
fb_status=$(wget --spider -S https://filebox.ece.vt.edu/ 2>&1 | grep  "HTTP/1.1 200 OK")

mkdir checkpoints

echo "downloading from filebox ..."
wget https://huggingface.co/spaces/Epoching/3D_Photo_Inpainting/resolve/main/checkpoints/color-model.pth
wget https://huggingface.co/spaces/Epoching/3D_Photo_Inpainting/resolve/main/checkpoints/depth-model.pth
wget https://huggingface.co/spaces/Epoching/3D_Photo_Inpainting/resolve/main/checkpoints/edge-model.pth
wget https://huggingface.co/spaces/Epoching/3D_Photo_Inpainting/resolve/main/MiDaS/model.pt
mv color-model.pth checkpoints/.
mv depth-model.pth checkpoints/.
mv edge-model.pth checkpoints/.
mv model.pt MiDaS/.

echo "cloning from BoostingMonocularDepth ..."
git clone https://github.com/compphoto/BoostingMonocularDepth.git
mkdir -p BoostingMonocularDepth/pix2pix/checkpoints/mergemodel/

echo "downloading mergenet weights ..."
wget https://huggingface.co/spaces/Epoching/3D_Photo_Inpainting/resolve/main/latest_net_G.pth
mv latest_net_G.pth BoostingMonocularDepth/pix2pix/checkpoints/mergemodel/
wget https://github.com/intel-isl/MiDaS/releases/download/v2/model-f46da743.pt
mv model-f46da743.pt BoostingMonocularDepth/midas/model.pt
