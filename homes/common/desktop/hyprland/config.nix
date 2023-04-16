{ home }:
let
  inherit (home.sessionVariables) TERMINAL BROWSER EDITOR;
in
''
  misc {
    vfr=on
  }

  input {
    kb_layout=be
    touchpad {
      disable_while_typing=false
    }
  }

  exec-once=waybar
  #exec=swaybg -i #$#{wallpaper} --mode fill
  exec-once=mako
  exec-once=swayidle -w

  bind=SUPER,Return,exec,${TERMINAL}
  bind=SUPER,w,exec,makoctl dismiss

  bind=SUPERSHIFT,q,killactive
  bind=SUPERSHIFT,e,exit

  blurls=waybar
''
