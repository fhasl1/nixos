{pkgs, ...}: {
  hardware = {
    amdgpu.opencl.enable = true;
    amdgpu.initrd.enable = true;
    graphics = {
      extraPackages = with pkgs; [
        mesa.opencl
      ];
    };
  };
}
