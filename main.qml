import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "./FramelessWindow"

ApplicationWindow {
    property real minWidth: 500;
    property real minHeight: 400;
    id:mainwindow
    visible: true
    width: 640
    height: 480
    flags:Qt.FramelessWindowHint | Qt.Window;
    FontLoader{
        id:icomoonFont;
        source: "./Font/icomoon.ttf";
    }
    FramelessWindow{
        parentObj: mainwindow;
        titleIcon: "qrc:/Images/laboratory.ico"
    }
}
