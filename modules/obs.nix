{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    obs-studio
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-pipewire-audio-capture
        pkgs.obs-studio-plugins.obs-vkcapture
        obs-gstreamer
        obs-vaapi
      ];
     })
  ];
}
