if test -e $HOME/bin/android-studio/bin
    set -gx PATH "$PATH:$HOME/bin/android-studio/bin"
end

if test -e $HOME/Android/Sdk
    set -gx ANDROID_SDK_ROOT "$HOME/Android/Sdk"

    if test -e $HOME/Android/Sdk/tools
        set -gx PATH "$PATH:$HOME/Android/Sdk/tools"
    end
    if test -e $HOME/Android/Sdk/platform-tools
        set -gx PATH "$PATH:$HOME/Android/Sdk/platform-tools"
    end
    if test -e $HOME/Android/Sdk/emulator
        set -gx PATH "$PATH:$HOME/Android/Sdk/emulator"
    end
end