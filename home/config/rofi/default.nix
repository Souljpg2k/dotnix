{
  programs.rofi.enable = true;
  xdg.configFile."rofi/config.rasi".text = ''
    * {
        background:    #f8f6fb;
        foreground:    #454447;
        selected:      #e5e4eb;
        text-selected: #645b6a;
        text-element:  #9e97a2;
        textbox:       #454447;
        background-color: transparent;
    }
    configuration {
        show-icons: true;
        location: 2;
        font: "Inter Medium 12";
        display-drun: "> ";
        display-run: "> ";
    }
    window {
        background-color: @background;
        border: 0;
        border-radius: 18px;
        width: 400px;
        padding: 2px;
        margin: 6px;
    }
    mainbox {
        padding: 5px;
        children: [ inputbar, listview ];
    }
    inputbar {
        background-color: @selected;
        border-radius: 14px;
        children: [ prompt, entry ];
        text-color: @foreground;
        padding: 8px 8px 8px 12px;
        margin: 0px 0px 4px 0px;
    }
    prompt {
        text-color: @foreground;
    }
    entry {
        text-color: @foreground;
        placeholder: "";
    }
    listview {
        lines: 12;
        border: 0px;
        fixed-height: false;
        scrollbar: false;
        spacing: 5px;
    }
    element {
        border-radius: 12px;
        padding: 5px;
        cursor: pointer;
    }
    element normal.normal,
    element alternate.normal {
        background-color: transparent;
        text-color: @text-element;
    }
    element selected.normal {
        background-color: @selected;
        text-color: @text-selected;
    }
    textbox {
        text-color: @textbox;
        padding: 10px;
    }
  '';
}