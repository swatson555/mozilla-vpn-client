/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.5
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtGraphicalEffects 1.14
import Mozilla.VPN 1.0
import "../themes/themes.js" as Theme
//
Popup {
    id: popup

    property var deviceName
    property var devicePublicKey
    property var wasmView

    leftInset: Theme.windowMargin
    rightInset: Theme.windowMargin
    topPadding: Theme.popupMargin
    bottomPadding: Theme.popupMargin
//    rightPadding: Theme.popupMargin
//    leftPadding: Theme.popupMargin
    modal: true
    focus: true
    anchors.centerIn: parent
    closePolicy: Popup.CloseOnEscape

    // TODO: We can not use Accessible type on Popup because it does not inherit
    // from an Item. The code below generates the following warning:
    // "...Accessible must be attached to an Item..."
    // See https://github.com/mozilla-mobile/mozilla-vpn-client/issues/322 for
    // more details.
    // Accessible.role: Accessible.Dialog
    // Accessible.name: popupTitle.text

    onClosed: {
        // When closing the dialog, put the focus back on the
        // remove button that originally triggered the dialog.
        if (wasmView) {
            return;
        }

        if (deviceList.focusedIconButton) {
            deviceList.focusedIconButton.forceActiveFocus();
        }
    }


    Overlay.modal: Rectangle {
        color: "#4D000000"
    }

    background: Rectangle {
        id: popupBackground

        color: Theme.bgColor
        radius: 8
        anchors.margins: 0

        DropShadow {
            id: popupShadow

            anchors.fill: popupBackground
            cached: true
            color: "black"
            opacity: 0.2
            radius: 16
            samples: 33
            source: popupBackground
            z: -1
            spread: 0.1
            transparentBorder: true
            verticalOffset: 4
        }
    }

    contentItem: Item {
        id: contentRoot

        ColumnLayout {
            id: col

            spacing: 0
            anchors.centerIn: contentRoot
            width: contentRoot.width - Theme.popupMargin * 2
            opacity: 1

            Behavior on opacity {
                PropertyAnimation {
                    duration: 200
                }
            }

            Image {
                Layout.alignment: Qt.AlignHCenter
                fillMode: Image.PreserveAspectFit
                source: "../resources/devicesRemove.svg"
                sourceSize: Qt.size(116, 80)
                Layout.preferredHeight: 72
            }

            VPNMetropolisLabel {
                id: popupTitle

                Layout.alignment: Qt.AlignHCenter
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                color: Theme.fontColorDark
                font.pixelSize: Theme.fontSizeLarge

                Layout.leftMargin: Theme.popupMargin
                Layout.rightMargin: Theme.popupMargin
                Layout.topMargin: 4
                Layout.bottomMargin: Theme.vSpacingSmall
                Layout.minimumHeight: 36
                verticalAlignment: Text.AlignBottom
                //% "Remove device?"
                text: qsTrId("vpn.devices.removeDeviceQuestion")
            }

            VPNTextBlock {
                id: popupText

                Layout.alignment: Qt.AlignHCenter
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                color: Theme.fontColor
                font.pixelSize: 15
                lineHeight: 22
                Layout.bottomMargin: Theme.vSpacingSmall

                //: %1 is the name of the device being removed. The name is displayed on purpose on a new line.
                //% "Please confirm you would like to remove\n%1."
                text: qsTrId("vpn.devices.deviceRemovalConfirm").arg(popup.deviceName)
            }

            GridLayout {
                Layout.fillWidth: true
                Layout.minimumHeight: Theme.rowHeight
                Layout.topMargin: Theme.popupMargin
                columnSpacing: 16
                columns: {
                    const cancelText = qsTrId("vpn.devices.cancelDeviceRemoval");
                    const removeText = qsTrId("vpn.devices.removeDeviceButton");
                    const showStackedButtons = cancelText.length > 8 || removeText.length > 8;

                    if (showStackedButtons) {
                        return 1
                    }
                    return 2;
                }

                VPNPopupButton {
                    id: cancelBtn

                    //% "Cancel"
                    buttonText: qsTrId("vpn.devices.cancelDeviceRemoval")
                    buttonTextColor: Theme.fontColorDark
                    colorScheme: Theme.greyButton
                    onClicked: {
                        popup.close();
                    }
                    focus: true
                    Accessible.defaultButton: true
                }

                VPNPopupButton {
                    id: removeBtn

                    //: This is the “remove” device button.
                    //% "Remove"
                    buttonText: qsTrId("vpn.devices.removeDeviceButton")
                    buttonTextColor: Theme.white
                    colorScheme: Theme.redButton
                    onClicked: {
                        VPN.removeDeviceFromPublicKey(popup.devicePublicKey);
                        if (vpnFlickable.state === "deviceLimit") {
                            // there is no further action the user can take on the deviceList
                            // so leave the modal open until the user is redirected back to the main view
                            col.opacity = .5
                            return;
                        }

                        popup.close();
                    }
                }

            }

        }

    }

}
