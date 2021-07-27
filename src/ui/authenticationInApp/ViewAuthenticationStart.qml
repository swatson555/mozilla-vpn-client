/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.5
import QtQuick.Layouts 1.14
import Mozilla.VPN 1.0

import "../themes/themes.js" as Theme

import "../components"
import "../components/forms"

VPNFlickable {
    // TODO
    // This view shows the authentication form. We need to collect an email
    // address and a password.
    // At this point we do not know if we are going to sign-in or sign-up.
    // The next step is to call VPNAuthInApp::sigInOrUp();

    // emailInput needs validator
    // password needs validator (reach out to FXA to dupe their validation)

    Component.onCompleted: console.log("START")

    VPNBoldLabel {
        text: "Step 1"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Theme.windowMargin
    }

    ColumnLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: Theme.vSpacing
        anchors.rightMargin: Theme.vSpacing
        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.windowMargin

        VPNHeadline {
            text: "Enter your email to sign in or create a new account"
            Layout.bottomMargin: Theme.vSpacing
            Layout.preferredWidth: parent.width
        }

        VPNTextField {
            id: emailInput
            Layout.fillWidth: true
            placeholderText: "Email" // TODO
        }

        VPNTextField {
            id: passwordInput
            echoMode: TextInput.Password
            Layout.fillWidth: true
            placeholderText: "secure password" // TODO
            Keys.onReturnPressed: {
                if (emailInput.length === 0 || passwordInput.lenght === 0) {
                    return;
                }
                btn.clicked();
            }
        }

        VPNButton {
            id: btn
            text: "Sign Up/In" // TODO
            Layout.fillWidth: true
            onClicked: VPNAuthInApp.signInOrUp(emailInput.text, passwordInput.text); // TODO: email check?
        }
    }
}
