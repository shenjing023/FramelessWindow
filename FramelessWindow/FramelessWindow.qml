import QtQuick 2.7
import QtQuick.Controls 2.2
import "../ContentWindow"

Page{
    property QtObject parentObj;
    property color borderColor: "#1883D7";  //边框颜色
    property string titleIcon;          //标题栏图标
    property color titleColor:"#00bfff";//标题栏颜色
    id:root;
    anchors.fill: parent;

    //边框
    background: Rectangle{
        anchors.fill: parent;
        border{
            color: borderColor;
            width: 1
        }
    }
    //标题栏
    TitleBar{
        icon: root.titleIcon;
        parentObj: root.parentObj;
        titleColor: root.titleColor;
        height: 30;
        anchors{
            left: parent.left
            leftMargin: 1
            right: parent.right
            rightMargin: 1
            top:parent.top
            topMargin: 1
        }
    }
    //主界面窗口
    ContentWindow{
        anchors{
            top:parent.top;
            topMargin: 31;
            left: parent.left;
            leftMargin: 1
            right: parent.right;
            rightMargin: 1
            bottom: parent.bottom
            bottomMargin: 1
        }
    }
    //窗口拉伸
    CustomMouseArea{
        id:left;
        type: 3;
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        parentObj: root.parentObj;
    }
    CustomMouseArea{
        id:right;
        type: 4;
        height: parent.height
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        parentObj: root.parentObj;
    }
    CustomMouseArea{
        id:top;
        type: 1;
        width: parent.width
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        parentObj: root.parentObj;
    }
    CustomMouseArea{
        id:bottom;
        type: 2;
        width: parent.width
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        parentObj: root.parentObj;
    }
    CustomMouseArea{
        id:topLeft;
        type: 5;
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        parentObj: root.parentObj;
    }
    CustomMouseArea{
        id:topRight;
        type: 6;
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        parentObj: root.parentObj;
    }
    CustomMouseArea{
        id: bottomLeft
        anchors.left:parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        parentObj: root.parentObj;
        type: 7
    }
    CustomMouseArea{
        id:bottomRight;
        type: 8;
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        parentObj: root.parentObj;
    }


}
