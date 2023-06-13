import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

Window {
    width: 640
    height: 480
    visible: true
    title: "Регистрация"

        Column {
            spacing: 10
            anchors.centerIn: parent

            TextField {
                id: nameField
                placeholderText: "Имя"
            }

            ComboBox {
                id: genderComboBox
                model: ["Мужской", "Женский"]
                displayText: "Пол"
            }

            TextField {
                id: ageField
                placeholderText: "Возраст"
                inputMethodHints: Qt.ImhDigitsOnly
            }

            TextField {
                id: educationField
                placeholderText: "Образование"
            }

            TextField {
                id: hobbiesField
                placeholderText: "Хобби"
            }

            TextField {
                id: cityField
                placeholderText: "Город"
            }

            TextArea {
                id: aboutField
                placeholderText: "Информация о себе"
            }

            GroupBox {
                title: "Параметры поиска партнёра"


                Column {
                    spacing: 10

                    TextField {
                        id: minAgeField
                        placeholderText: "Минимальный возраст"
                        inputMethodHints: Qt.ImhDigitsOnly
                    }

                    TextField {
                        id: maxAgeField
                        placeholderText: "Максимальный возраст"
                        inputMethodHints: Qt.ImhDigitsOnly
                    }

                    ComboBox {
                        id: partnerGenderComboBox
                        model: ["Мужской", "Женский"]
                        displayText: "Пол партнёра"
                    }

                    TextField {
                        id: partnerEducationField
                        placeholderText: "Уровень образования партнёра"
                    }
                }
            }

            Button {
                text: "Регистрация"
                onClicked: {
                    // Выводим отчет в консоль
                    console.log("Отчет о регистрации:")
                    console.log("Имя:", nameField.text)
                    console.log("Пол:", genderComboBox.currentText)
                    console.log("Возраст:", ageField.text)
                    console.log("Образование:", educationField.text)
                    console.log("Хобби:", hobbiesField.text)
                    console.log("Город:", cityField.text)
                    console.log("Информация о себе:", aboutField.text)
                    console.log("Параметры поиска партнёра:")
                    console.log("Минимальный возраст партнёра:", minAgeField.text)
                    console.log("Максимальный возраст партнёра:", maxAgeField.text)
                    console.log("Пол партнёра:", partnerGenderComboBox.currentText)
                    console.log("Уровень образования партнёра:", partnerEducationField.text)
                }
            }
        }
}
