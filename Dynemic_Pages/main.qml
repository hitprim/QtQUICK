import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQml 2.3

Window {
    width: 400
    height: 300
    id: mainWindow
    visible: true
    title: qsTr("Hello World")

    Item {
        anchors.fill: parent

        StackView {
            id: stackView
            anchors.fill: parent
            initialItem: loginPage
        }

        Component.onCompleted: {
            stackView.push(loginPage)
        }
    }

    Component {
        id: loginPage

        Rectangle {
            color: "lightblue"
            anchors.fill: parent

            Column {
                spacing: 10
                anchors.centerIn: parent

                TextField {
                    id: usernameField
                    placeholderText: "Username"
                    width: 200
                }

                TextField {
                    id: passwordField
                    placeholderText: "Password"
                    width: 200
                    echoMode: TextInput.Password
                }

                Button {
                    text: "Log in"
                    width: 100
                    onClicked: {
                        if (passwordField.text === "password") {
                            stackView.push(appPage)
                            stackView.pop()
                        }
                    }
                }
            }
        }
    }

    Component {
        id: appPage

        Rectangle {
            color: "lightgreen"
            anchors.fill: parent

            Column {
                spacing: 10
                anchors.centerIn: parent

                Label {
                    text: "Welcome to the app!"
                    font.pixelSize: 24
                }

                Button {
                    text: "Switch to Login"
                    width: 150
                    onClicked: {
                        stackView.push(loginPage)
                        stackView.pop()
                    }
                }
            }
        }
    }
}
