{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      twxs.cmake
      ms-vscode.cmake-tools
      ms-vscode.makefile-tools
      ms-python.python
    ];
    userSettings = {
      "files.autoSave" = "onFocusChange";
      "editor.insertSpaces" = false;
      "editor.minimap.enabled" = false;
    };
  };
}
