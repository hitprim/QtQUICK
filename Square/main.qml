import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 6.3


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: rectangle
        x: 150
        y: 39
        width: 399
        height: 100
        color: "#c9ddaa"

        Text {
            id: text1
            x: 13
            y: 21
            width: 23
            height: 26
            text: qsTr("A")
            font.pixelSize: 12
        }

        Text {
            id: text2
            x: 13
            y: 42
            width: 23
            height: 26
            text: qsTr("B")
            font.pixelSize: 12
        }

        Text {
            id: text3
            x: 13
            y: 65
            width: 23
            height: 26
            text: qsTr("C")
            font.pixelSize: 12
        }

        TextField {
            id: textField
            x: 32
            y: 14
            width: 86
            height: 22

        }

        TextField {
            id: textField1
            x: 32
            y: 37
            width: 86
            height: 22

        }

        TextField {
            id: textField2
            x: 32
            y: 60
            width: 86
            height: 22

        }

        Button {
            id: button
            x: 157
            y: 38
            width: 53
            height: 25
            text: qsTr("Result:")
            onClicked: {

                var a = parseFloat(textField.text)
                var b = parseFloat(textField1.text)
                var c = parseFloat(textField2.text)

                var p = ((a+b+c) / 2)

                var S = Math.sqrt(p*((p-a)*(p-b)*(p-c)))

                label.text =  S.toFixed(1)
            }
        }

        Label {
            id: label
            x: 211
            y: 38
            width: 100
            height: 21
            text: qsTr("")
        }
    }

    Rectangle {
        id: rectangle1
        x: 150
        y: 193
        width: 399
        height: 121
        color: "#e0fffe"

        Text {
            id: text4
            x: 8
            y: 13
            text: qsTr("Ax")
            font.pixelSize: 12
        }

        Text {
            id: text5
            x: 8
            y: 41
            text: qsTr("Bx")
            font.pixelSize: 12
        }

        Text {
            id: text6
            x: 8
            y: 69
            text: qsTr("Cx")
            font.pixelSize: 12
        }

        Text {
            id: text7
            x: 85
            y: 13
            text: qsTr("Ay")
            font.pixelSize: 12
        }

        Text {
            id: text8
            x: 85
            y: 41
            text: qsTr("By")
            font.pixelSize: 12
        }

        Text {
            id: text9
            x: 85
            y: 69
            text: qsTr("Cy")
            font.pixelSize: 12
        }

        TextField {
            id: _Ax
            x: 32
            y: 14
            width: 47
            height: 22
        }

        TextField {
            id: _Bx
            x: 32
            y: 42
            width: 47
            height: 22
        }

        TextField {
            id: _Cx
            x: 32
            y: 69
            width: 47
            height: 22
        }

        TextField {
            id: _Ay
            x: 112
            y: 10
            width: 47
            height: 22
        }

        TextField {
            id: _By
            x: 112
            y: 42
            width: 47
            height: 22
        }

        TextField {
            id: _Cy
            x: 112
            y: 69
            width: 47
            height: 22
        }

        Button {
            id: button_res
            x: 193
            y: 39
            width: 53
            height: 25
            text: qsTr("Result:")

            onClicked: {
                var Ax = parseFloat(_Ax.text)
                var Ay = parseFloat(_Ay.text)
                var Bx = parseFloat(_Bx.text)
                var By = parseFloat(_By.text)
                var Cx = parseFloat(_Cx.text)
                var Cy = parseFloat(_Cy.text)

                var S = 0.5*Math.abs(((Bx-Ax)*(Cy-Ay)) - ((Cx-Ax)*(By-Ay)))

                label1.text =  S.toFixed(1)
            }
        }

        Label {
            id: label1
            x: 252
            y: 39
            width: 100
            height: 21
            text: qsTr("")
        }
    }
}
