{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-pipewire-audio-capture
        obs-gstreamer
        obs-vaapi
        obs-vkcapture
      ];
     })
  ];
}
