import QtQuick
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property var password: "111"
    property string status: "unlocked"

    Popup{
        id: popup
        anchors.centerIn: parent
        width: 70
        height: 70
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        Text {
            id: name
            anchors.centerIn: parent
            text: status
        }
    }

    Column {
        id: column
        x: 11
        y: 35
        width: 209
        height: 206
        spacing: 5


        Label {
            id: label
            height: 10
            text: "000"
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Row {
            id: row
            width: column.width
            height: column.width - 60
            spacing: 0
            anchors.centerIn: parent

            Tumbler {
                id: tumbler
                width: row.width / 3
                height: row.height
                model: 10
                onCurrentIndexChanged:
                {
                    label.text = tumbler.currentIndex + "" + tumbler1.currentIndex + "" + tumbler2.currentIndex
                }
            }

            Tumbler {
                id: tumbler1
                width: row.width / 3
                height: row.height
                model: 10
                onCurrentIndexChanged:
                {
                    label.text = tumbler.currentIndex + "" + tumbler1.currentIndex + "" + tumbler2.currentIndex
                }
            }

            Tumbler {
                id: tumbler2
                width: row.width / 3
                height: row.height
                model: 10
                onCurrentIndexChanged:
                {
                    label.text = tumbler.currentIndex + "" + tumbler1.currentIndex + "" + tumbler2.currentIndex
                }
            }
        }

        Button {
            id: button
            text: "check"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                popup.open()
                if(label.text === password) status = "locked"
                else status = "unlocked"
            }
        }

    }


    property string login: "Max"
    property string passwordLogin: "password"

    Popup{
        id: popup1
        anchors.centerIn: parent
        width: 70
        height: 70
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        Text {
            id: name1
            anchors.centerIn: parent
            text: status
        }
    }

    Column {
        id: column1
        x: 233
        y: 40
        width: 150
        height: 201
        spacing: 10

        Grid {
            id: grid
            width: column1.width
            height: column1.height - button1.height - 10
            spacing: 10
            padding: 0
            topPadding: 15
            rows: 2
            columns: 2

            Label {
                id: label1
                text: "login"
            }

            TextField {
                id: textField
                width: 60
                placeholderText: qsTr("Text Field")
            }

            Label {
                id: label2
                text: "password"
            }

            TextField {
                id: textField1
                width: 60
                placeholderText: qsTr("Text Field")
                echoMode: TextInput.Password
            }
        }

        Button {
            id: button1
            text: "check"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                if(textField.text === login && textField1.text === passwordLogin) status = "locked"
                else status = "unlocked"
                popup1.open()
            }
        }



    }

    Column {
        id: column2
        x: 408
        y: 40
        width: 209
        height: 201
        spacing: 10

        ScrollView {
            id: view
            width: column2.width
            height: column2.height - textField2.height - 20

            TextArea {
                id: textArea
                anchors.fill: parent
                placeholderText: qsTr("Text Area")
                background: Rectangle {
                        color: "#f5db7d"
                        border.color: "#ccc"
                }
            }
        }

        TextField {
            id: textField2
            width: column2.width
            placeholderText: qsTr("Text Field")
            background: Rectangle {
                color: "#a3f57d"
                border.color: "#ccc"
            }
            Keys.onReturnPressed: {
                textArea.append(textField2.text)
                textField2.clear()
                //view.contentItem.contentY = textArea.height - view.contentItem.height
                view.contentY = view.contentHeight - view.height
            }
        }
    }
}
