#!/bin/sh
clt_placeholder='/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress' &&
    sudo touch "$clt_placeholder" &&
    clt_label="$(softwareupdate -l | grep -B 1 -E 'Command Line (Developer|Tools)' | awk -F'*' '/^ +\\*/ { print $2 }' | sed 's/^ *//' | tail -n 1)" &&
    sudo softwareupdate -i "$clt_label" &&
    sudo rm -f "$clt_placeholder" &&
    sudo xcode-select --switch /Library/Developer/CommandLineTools &&
    curl -OLj \
        -H 'Cookie: oraclelicense=accept-securebackup-cookie' \
        http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/jdk-9.0.1_osx-x64_bin.dmg &&
    hdiutil attach jdk-9.0.1_osx-x64_bin.dmg &&
    sudo installer -pkg /Volumes/JDK\ 9.0.1/JDK\ 9.0.1.pkg -target / &&
    hdiutil eject -force /Volumes/JDK\ 9.0.1;
    rm jdk-9.0.1_osx-x64_bin.dmg &&
    curl -OL https://dl.bintray.com/xquartz/downloads/XQuartz-2.7.11.dmg &&
    hdiutil attach XQuartz-2.7.11.dmg &&
    sudo installer -pkg /Volumes/XQuartz-2.7.11/XQuartz.pkg -target / &&
    hdiutil eject -force /Volumes/XQuartz-2.7.11;
    rm XQuartz-2.7.11.dmg &&
    curl -OL https://github.com/fink/scripts/releases/download/setup%2F0.42.0/InstallFink.tgz &&
    tar xzvf InstallFink.tgz &&
    yes '' | sudo InstallFink/Install\ Fink.tool &&
    yes | /sw/bin/pathsetup.sh &&
    rm InstallFink.tgz
