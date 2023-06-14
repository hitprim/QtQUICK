import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: square
        width: 200
        height: 200
        color: "steelblue"
        radius: square.isCircle ? 100 : 0
        anchors.centerIn: parent
        transformOrigin: Item.Center

        property bool isCircle: false

        Behavior on radius {
            NumberAnimation {
                duration: 500
            }
        }

        MouseArea{
            id: mouseArea
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: (mouse)=> {
                if(mouse.button === Qt.LeftButton){
                    square.color = getRandomColor();
                }
                else if(mouse.button === Qt.RightButton){

                        animationSequence.start();

                }
            }

            onDoubleClicked: {
                square.isCircle = !square.isCircle;
            }
        }
    }

    SequentialAnimation {
        id: animationSequence

        PropertyAnimation {
            target: square
            property: "rotation"
            to: 360
            duration: 1000
            easing.type: Easing.InOutQuad
        }

        PropertyAnimation {
            target: square
            property: "rotation"
            to: 0
            duration: 0
        }
    }

    function getRandomColor() {
        var color = "#";
        var hexChars = "0123456789ABCDEF";
        for (var i = 0; i < 6; i++) {
            color += hexChars[Math.floor(Math.random() * 16)];
        }
        return color;
    }
}
