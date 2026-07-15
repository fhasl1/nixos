{ pkgs, ... }:

let
  kernel = pkgs.linuxPackages_latest.kernel;
  customKernel = pkgs.linuxManualConfig {
    src = kernel.src;
    version = kernel.version;
    configfile = ../../dotconfig;
    allowImportFromDerivation = true;
  };
in {
  boot.kernelPackages = pkgs.linuxPackagesFor customKernel;
}
