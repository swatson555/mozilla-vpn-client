Source: mozillavpn
Section: net
Priority: optional
Maintainer: mozilla <vpn@mozilla.com>
Build-Depends: debhelper (>= 8.1.3),
               cdbs,
               quilt,
               flex,
               libqt5charts5-dev (>=5.14.2-2),
               libqt5networkauth5-dev (>=5.14.2-2),
               libqt5websockets5-dev (>=5.14.2-2),
               qt5-default (>=5.14.2+dfsg-6),
               qtbase5-dev (>=5.14.2+dfsg-6),
               qtbase5-dev-tools (>=5.14.2+dfsg-6),
               qtdeclarative5-dev (>=5.14.2+dfsg-3ubuntu1),
               qtdeclarative5-dev-tools (>=5.14.2+dfsg-3ubuntu1),
               qt5-qmake-bin (>=5.14.2+dfsg-6),
               qttools5-dev-tools (>=5.14.2-3),
               libxcb-render0-dev,
               libxcb-image0-dev,
               libxcb-shape0-dev,
               libxcb-sync0-dev,
               libxcb-render-util0-dev,
               libxcb1-dev,
               libxcb-xfixes0-dev,
               libxcb-icccm4-dev,
               libxcb1-dev,
               libx11-xcb-dev,
               libxcb-keysyms1-dev,
               libxcb-image0-dev,
               libxcb-shm0-dev,
               libxcb-icccm4-dev,
               libxcb-sync0-dev,
               libxcb-xfixes0-dev,
               libxrender-dev,
               libxcb-shape0-dev,
               g++-4.6 (>= 4.6.0-7~) [armel],
               libasound2-dev [linux-any],
               libaudio-dev,
               libcups2-dev,
               libdbus-1-dev,
               libfreetype6-dev,
               libgl1-mesa-dev [!armel !armhf] | libgl-dev [!armel !armhf],
               libgles2-mesa-dev [armel armhf] | libgles2-dev [armel armhf],
               libglib2.0-dev,
               libglu1-mesa-dev [!armel !armhf] | libglu-dev [!armel !armhf],
               libice-dev,
               libjpeg-dev,
               libmng-dev,
               libpng-dev,
               libsm-dev,
               libsqlite3-dev,
               libssl-dev,
               libtiff5-dev,
               libx11-dev,
               libxcursor-dev,
               libxext-dev,
               libxft-dev,
               libxi-dev,
               libxinerama-dev,
               libxmu-dev,
               libxrandr-dev,
               libxrender-dev,
               libxt-dev,
               libxv-dev,
               zlib1g-dev,
               libedit-dev,
               libvulkan-dev,
               libpolkit-gobject-1-dev
Standards-Version: 4.4.1
Homepage: https://vpn.mozilla.org/
Vcs-Git: https://github.com/mozilla-mobile/mozilla-vpn-client

Package: mozillavpn
Architecture: any
Depends: libpolkit-gobject-1-0 (>=0.105-20ubuntu0.18.04.5),
         wireguard (>=1.0.20200513-1~18.04.2),
         wireguard-tools (>=1.0.20200513-1~18.04.2),
         resolvconf (>=1.82),
         libqt5charts5 (>=5.14.2-2),
         libqt5quick5 (>=5.14.2+dfsg-3ubuntu1),
         libqt5widgets5 (>=5.14.2+dfsg-6),
         libqt5gui5 (>=5.14.2+dfsg-6),
         libqt5qml5 (>=5.14.2+dfsg-3ubuntu1),
         libqt5network5 (>=5.14.2+dfsg-6),
         libqt5networkauth5 (>=5.14.2-2),
         libqt5dbus5 (>=5.14.2+dfsg-6),
         libqt5core5a (>=5.14.2+dfsg-6),
         libqt5qmlmodels5 (>=5.14.2+dfsg-3ubuntu1),
         libqt5svg5 (>=5.14.2-2),
         libqt5quickcontrols2-5 (>=5.14.2+dfsg-2),
         libqt5websockets5 (>= 5.14.2-2),
         qml-module-qtcharts (>=5.14.2-2),
         qml-module-qtgraphicaleffects (>=5.14.2-2),
         qml-module-qtquick-controls (>=5.14.2-2),
         qml-module-qtquick-controls2 (>=5.14.2+dfsg-2),
         qml-module-qtquick-extras (>=5.14.2-2),
         qml-module-qtquick-layouts (>=5.14.2+dfsg-3ubuntu1),
         qml-module-qtquick-window2 (>=5.14.2+dfsg-3ubuntu1),
         qml-module-qtquick2 (>=5.14.2+dfsg-3ubuntu1),
         qml-module-qtqml-models2 (>=5.14.2+dfsg-3ubuntu1),
         qml-module-qtqml (>=5.14.2+dfsg-3ubuntu1)
Description: A fast, secure and easy to use VPN. Built by the makers of Firefox.
 Read more on https://vpn.mozilla.org

