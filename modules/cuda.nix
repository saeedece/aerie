{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs.cudaPackages; [
    cuda_nvcc
    cuda_cudart
    cudnn
    cutensor
    nccl
  ];
}
