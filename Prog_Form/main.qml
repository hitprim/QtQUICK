import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Form")


    Rectangle{
        width: parent.width
        height: parent.height
        color: "red"
        id: _mainWindow



        property bool loginIn: false
        property bool notLoginIn: false
        property bool search: false

        states: [
            State {
                name: "notLogged"

                PropertyChanges {
                    target: regForm
                    visible: false

                }
                PropertyChanges {
                    target: notlog
                    visible: true
                    rotation: 360
                }
                PropertyChanges {
                    target: logged
                    visible: false
                }
                PropertyChanges {
                    target: loading
                    running: false
                }
                PropertyChanges {
                    target: searchPage
                    visible: false

                }
            },
            State {
                name: "loginIn"
                //when: _mainWindow.loginIn
                PropertyChanges {
                    target: notlog
                    visible: false

                }
                PropertyChanges {
                    target: regForm;
                    visible: false
                }
                PropertyChanges {
                    target: logged
                    visible: true
                }
                PropertyChanges {
                    target: loading
                    running: false
                }
                PropertyChanges {
                    target: searchPage
                    visible: false

                }

            },
            State {
                name: "Search"
                PropertyChanges {
                    target: logged
                    visible: false
                }
                PropertyChanges {
                    target: notlog
                    visible: false

                }
                PropertyChanges {
                    target: regForm
                    visible: false
                }
                PropertyChanges {
                    target: loading
                    running: true

                }
                PropertyChanges {
                    target: searchPage
                    visible: false

                }
            },
            State {
                name: "Search_Page"
                PropertyChanges {
                    target: logged
                    visible: false
                }
                PropertyChanges {
                    target: notlog
                    visible: false

                }
                PropertyChanges {
                    target: regForm
                    visible: false
                }
                PropertyChanges {
                    target: loading
                    running: false


                }
                PropertyChanges {
                    target: searchPage
                    visible: true

                }
            }
        ]

        transitions: [
            Transition {
                from: ""
                to: "loginIn"
                PropertyAnimation { target: logged;
                    property: "visible";
                    duration: 1000;
                    easing.type: Easing.OutQuart;

                }
            }

        ]

        Rectangle{
            id: regForm
            anchors.horizontalCenter: _mainWindow.horizontalCenter
            anchors.top: _mainWindow.top
            anchors.topMargin: 80
            width: 440
            height: 280
            Column{
                spacing: 10
                anchors.centerIn: parent
                TextField {
                    id: nameField
                    placeholderText: "Login"
                }

                TextField {
                    id: passField
                    placeholderText: "Password"
                }



                Button{
                    id: logButton
                    text: "Sign In"
                    onClicked: {
                        if(nameField.text === "login" & passField.text === "password"){
                            //_mainWindow.loginIn = true
                            _mainWindow.state = "loginIn"
                        }
                        else{
                            _mainWindow.state = "notLogged"
                        }
                    }
                }

                Button{
                    id:search_button
                    text: "Search"
                    onClicked: {

                        _mainWindow.state = "Search"
                    }
                }
            }
        }

        Rectangle{
            visible: false
            anchors.horizontalCenter: _mainWindow.horizontalCenter
            anchors.top: _mainWindow.top
            anchors.topMargin: 80
            width: 240
            antialiasing: true
            height: 80
            id: notlog
            Text {
                anchors.centerIn: parent
                color: "green"
                text: qsTr("Not Logged")
                font.bold: true
                font.pointSize: 14

            }

        }

        Rectangle{
            visible: false
            anchors.horizontalCenter: _mainWindow.horizontalCenter
            anchors.top: _mainWindow.top
            anchors.topMargin: 80
            width: 240
            height: 80
            id: logged
            Text {
                anchors.centerIn: parent
                color: "red"
                text: qsTr("Main Page")
            }
        }

        BusyIndicator{
            id: loading
            anchors.centerIn: parent
            running: false

            Timer{
                id: visibilityTimer
                interval: 2000
                running: true
                repeat: false
                onTriggered: {
                    if(loading.running){
                        _mainWindow.state = "Search_Page"
                    }
                }
            }
        }

        Rectangle{
            visible: false
            anchors.horizontalCenter: _mainWindow.horizontalCenter
            anchors.top: _mainWindow.top
            anchors.topMargin: 80
            width: 240
            height: 80
            id: searchPage
            Text {
                anchors.centerIn: parent
                color: "red"
                text: qsTr("Search Page")
            }
        }

    }

}

