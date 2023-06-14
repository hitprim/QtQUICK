import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

Window {
    width: 240
    height: 180
    visible: true
    title: qsTr("Hello World")

    // Модель с данными о книгах
    ListModel {
        id: bookModel

        ListElement {
            cover: "qrc:/image/1285742151ct.jpg"
            title: "Книга 1"
            genre: "Жанр 1"
            author: "Автор 1"
        }
        ListElement {
            cover: "qrc:/image/1689474630ct.jpg"
            title: "Книга 2"
            genre: "Жанр 2"
            author: "Автор 2"
        }
        // Добавьте больше элементов модели по вашему усмотрению
    }

    ListView{
        id: list
        anchors.fill: parent
        model: bookModel
        spacing: 2
        header: Rectangle{
            width: parent.width
            height: 20
            color: "darkblue"
            Text {
                text: "Моя библиотека"
                font.pixelSize: 18
                color: "steelblue"
                horizontalAlignment: Text.AlignHCenter
            }
        }

        footer: Rectangle{
            width: parent.width
            height: 20
            color: "darkgreen"
            Text {
                id: footer
                text: "Разработано мной"
                font.pixelSize: 14
                color: "gray"
                horizontalAlignment: Text.AlignHCenter
            }
        }

        section.delegate: Rectangle{
            width: parent.width
            height: 20
            color: "lightblue"
            Text {
            anchors.centerIn: parent
            text: section
            color: "darkblue"
            font.weight: Font.Bold
            }
        }

        section.property: "genre"

        delegate: Rectangle{
            width: list.width
            height: 50
            radius: 3
            border.width: 1
            border.color: "darkgray"
            color: "lightgray"

            Image {
                source: cover
                sourceSize.width: 300
                sourceSize.height: 50

            }

            Column{
                anchors.fill: parent

                Row{
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text { text: "Title"; font.weight: Font.Bold}
                    Text { text: title }
                    spacing: 20
                }

                Row{
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text { text: "Gener"; font.weight: Font.Bold}
                    Text { text: genre }
                    spacing: 20
                }

                Row{

                    anchors.horizontalCenter: parent.horizontalCenter
                    Text { text: "Author"; font.weight: Font.Bold}

                    Text{text: author}
                    spacing: 20
                }
            }


        }

    }

}
