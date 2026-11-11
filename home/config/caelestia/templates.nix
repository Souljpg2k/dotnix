{
  xdg.configFile."caelestia/templates/kitty.conf".text = ''
    foreground #{{ onSurface.hex }}
    background #{{ surface.hex }}
    cursor #{{ secondary.hex }}
    selection_background #{{ secondary.hex }}

    color0  #{{ term0.hex }}
    color1  #{{ term1.hex }}
    color2  #{{ term2.hex }}
    color3  #{{ term3.hex }}
    color4  #{{ term4.hex }}
    color5  #{{ term5.hex }}
    color6  #{{ term6.hex }}
    color7  #{{ term7.hex }}
    color8  #{{ term8.hex }}
    color9  #{{ term9.hex }}
    color10 #{{ term10.hex }}
    color11 #{{ term11.hex }}
    color12 #{{ term12.hex }}
    color13 #{{ term13.hex }}
    color14 #{{ term14.hex }}
    color15 #{{ term15.hex }}
  '';

  xdg.configFile."caelestia/templates/rofi.rasi".text = ''
    * {
        background:         #{{ surface.hex }};
        foreground:         #{{ onSurface.hex }};
        selected:           #{{ surfaceContainerHighest.hex }};
        text-selected:      #{{ secondary.hex }};
        text-element:       #{{ onSurfaceVariant.hex }};
        textbox:            #{{ onSurface.hex }};
        background-color:   transparent;
    }
  '';

  xdg.configFile."caelestia/templates/qtct-colors.conf".text = ''
    [ColorScheme]
    active_colors=#{{ onSurface.hex }}, #{{ surface.hex }}, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #{{ onSurface.hex }}, #ffffff, #{{ onSurface.hex }}, #{{ background.hex }}, #{{ background.hex }}, #{{ shadow.hex }}, #{{ primaryContainer.hex }}, #{{ onPrimaryContainer.hex }}, #{{ secondary.hex }}, #{{ primary.hex }}, #{{ surface.hex }}, #{{ scrim.hex }}, #{{ surface.hex }}, #{{ onSurface.hex }}, #{{ secondary.hex }}
    disabled_colors=#{{ onSurface.hex }}, #{{ surface.hex }}, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #{{ onSurface.hex }}, #ffffff, #{{ onSurface.hex }}, #{{ background.hex }}, #{{ background.hex }}, #{{ shadow.hex }}, #{{ primaryContainer.hex }}, #{{ onPrimaryContainer.hex }}, #{{ secondary.hex }}, #{{ primary.hex }}, #{{ surface.hex }}, #{{ scrim.hex }}, #{{ surface.hex }}, #{{ onSurface.hex }}, #{{ secondary.hex }}
    inactive_colors=#{{ onSurface.hex }}, #{{ surface.hex }}, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #{{ onSurface.hex }}, #ffffff, #{{ onSurface.hex }}, #{{ background.hex }}, #{{ background.hex }}, #{{ shadow.hex }}, #{{ primaryContainer.hex }}, #{{ onPrimaryContainer.hex }}, #{{ secondary.hex }}, #{{ primary.hex }}, #{{ surface.hex }}, #{{ scrim.hex }}, #{{ surface.hex }}, #{{ onSurface.hex }}, #{{ secondary.hex }}
  '';

  xdg.configFile."caelestia/templates/kdeglobals.conf".text = ''
    [Colors:View]
    BackgroundAlternate=#{{ surfaceContainer.hex }}
    BackgroundNormal=#{{ surface.hex }}
    DecorationFocus=#{{ primary.hex }}
    DecorationHover=#{{ secondary.hex }}
    ForegroundActive=#{{ primary.hex }}
    ForegroundInactive=#{{ onSurfaceVariant.hex }}
    ForegroundLink=#{{ primary.hex }}
    ForegroundNegative=#{{ error.hex }}
    ForegroundNeutral=#{{ tertiary.hex }}
    ForegroundNormal=#{{ onSurface.hex }}
    ForegroundPositive=#{{ success.hex }}
    ForegroundVisited=#{{ secondary.hex }}
  '';
}
