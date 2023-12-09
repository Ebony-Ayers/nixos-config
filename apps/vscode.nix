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
      "cmake.showOptionsMovedNotification" = false;
      "C_Cpp.default.cppStandard" = "c++20";
      "C_Cpp.default.intelliSenseMode" = "linux-gcc-x86";
      "C_Cpp.vcFormat.indent.preprocessor" = "none";
    };
  };
}
