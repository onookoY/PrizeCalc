import QtQuick 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls 2.0

ApplicationWindow{
    visible: true
    width: 595
    height: 220
    title: qsTr("Калькулятор важных цифр")
    color: Material.color(Material.Grey)
    Pane{
        width: 250
        height: 40
        x: 20
        y: 10
        Material.elevation: 6        
        Label{
            Text{
                id: oklad_text
                visible: true
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Размер оклада:")
                font.pixelSize: 16
                color: Material.color(Material.Indigo)
            }
            TextField{
                id: oklad_arg_field
                anchors.verticalCenter: parent.verticalCenter
                x: 150
                width: 60
                font.pixelSize: 16
                Material.foreground: Material.Pink
                Material.accent: Material.Indigo
            }
        }
    }
    Pane{
        width: 250
        height: 40
        x: 20
        y: 60
        Material.elevation: 6 
        Label{
            Text{
                id: day_text
                visible: true
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Рабочие дни:")
                font.pixelSize: 16
                color: Material.color(Material.Indigo)
            }
            TextField{
                id: day_argfield
                anchors.verticalCenter: parent.verticalCenter
                x: 150
                width: 60
                font.pixelSize: 16
                Material.foreground: Material.Pink
                Material.accent: Material.Indigo
            }
        }
    }
    Pane{
        width: 250
        height: 40
        x: 20
        y: 110
        Material.elevation: 6 
        Label{
            Text{
                id: otday_text
                visible: true
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Отработанные дни:")
                font.pixelSize: 16
                color: Material.color(Material.Indigo)
            }
            TextField{
                id: otday_argfield
                anchors.verticalCenter: parent.verticalCenter
                x: 150
                width: 60
                font.pixelSize: 16
                Material.foreground: Material.Pink
                Material.accent: Material.Indigo
            }
        }
    }
    Pane{
        width: 250
        height: 40
        x: 20
        y: 160
        Material.elevation: 6 
        Label{
            Text{
                id: percent_text
                visible: true
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Проценты:")
                font.pixelSize: 16
                color: Material.color(Material.Indigo)
            }
            TextField{
                id: percent_argfield
                anchors.verticalCenter: parent.verticalCenter
                x: 150
                width: 60
                font.pixelSize: 16
                Material.foreground: Material.Pink
                Material.accent: Material.Indigo
            }
        }
    }
    Pane{
        width: 150
        height: 40
        x: 425
        y: 10
        Material.elevation: 6 
        Label{
            id: money_result_label
            Material.foreground: Material.Pink
            font.pixelSize: 16
            anchors.centerIn: parent
        }
    }
    Pane{
        width: 150
        height: 40
        x: 425
        y: 60
        Material.elevation: 6 
        Label{
            id: percent_result_label
            Material.foreground: Material.Pink
            font.pixelSize: 16
            anchors.centerIn: parent
        }
    }
    Button{
        id: calculate_button
        visible: true
        x: 300
        y: 5
        text: qsTr("Рассчитать")
        highlighted: true
        Material.background: Material.Orange
        onClicked:{
            calculator_qml.money_def(oklad_arg_field.text, day_argfield.text, otday_argfield.text)
            calculator_qml.percent_def(money_result_label.text, percent_argfield.text)
        }

    }
    Connections{
        target: calculator_qml
        onMoneyResult:{
            money_result_label.text = money
        }
        onPercentResult:{
            percent_result_label.text = percent
        }
    }
}