import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Window 2.2

Rectangle{
    property string icon;
    property string title:qsTr("窗口");
    property QtObject parentObj;
    property color titleColor: "#00bfff";
    property color minBtnClickColor: "#33afff";//点击时颜色
    property color minBtnHoveredColor: "#00afff";//hover颜色
    property color minBtnNormalColor: "#00bfff";//正常状态颜色
    property color maxBtnClickColor: "#33afff";
    property color maxBtnHoveredColor: "#00afff";
    property color maxBtnNormalColor: "#00bfff";
    property color closeBtnClickColor: "#FB6177";
    property color closeBtnHoveredColor: "#FB6155";
    property color closeBtnNormalColor: "#00bfff";

    id:titleBar;
    color: titleColor;

    MouseArea{
        property real xmouse;   //鼠标的x轴坐标
        property real ymouse;   //y轴坐标
        anchors.fill: parent
        cursorShape: Qt.SizeAllCursor;

        onPressed: {
                    xmouse=mouse.x;
                    ymouse=mouse.y;
                }

                onPositionChanged: {
                    parentObj.x=parentObj.x+(mouse.x-xmouse);
                    parentObj.y=parentObj.y+(mouse.y-ymouse);
                }
    }

    //图标
    Image {
        id: titleIcon
        source: icon;
        width: parent.height-5
        height: parent.height-5
        anchors{
            left: parent.left;
            leftMargin: 5;
            verticalCenter: parent.verticalCenter;
        }
    }

    //标题
    Label{
        anchors{
            left: titleIcon.right;
            leftMargin: 5;
            verticalCenter: parent.verticalCenter;
        }
        text: title;
        font{
            family: "Microsoft YaHei";
            pixelSize: 14;
            bold: false;
        }
    }

    //最小化
    Button{
        id:minBtn;
        anchors{
            right: maxBtn.left;
        }
        flat: true;
        font{
            family: icomoonFont.name;
            pixelSize: titleBar.height/2;
        }
        text: "\uf4e4";
        background: Rectangle{
            implicitWidth: titleBar.height;
            implicitHeight: titleBar.height;
            color: {
                if(minBtn.pressed && minBtn.hovered)
                    return minBtnClickColor;
                if(minBtn.hovered)
                    return minBtnHoveredColor;
                else
                    return minBtnNormalColor;
            }
        }
        contentItem: Label{
            text: minBtn.text;
            font: minBtn.font;
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        ToolTip.visible: minBtn.hovered;
        ToolTip.delay: 500;
        ToolTip.text: qsTr("最小化");

        onClicked: {
            parentObj.visibility=Window.Minimized;
        }
    }
    //最大化
    Button{
        id:maxBtn;
        anchors{
            right: closeBtn.left;
        }
        flat: true;
        font{
            family: icomoonFont.name;
            pixelSize: titleBar.height/2;
        }
        text: {
            if(parentObj.visibility!==Window.FullScreen)
                return "\uf4a7";
            else
                return "\ufe57";
        }

        background: Rectangle{
            implicitWidth: titleBar.height;
            implicitHeight: titleBar.height;
            color: {
                if(maxBtn.pressed && maxBtn.hovered)
                    return maxBtnClickColor;
                if(maxBtn.hovered)
                    return maxBtnHoveredColor;
                else
                    return maxBtnNormalColor;
            }
        }
        contentItem: Label{
            text: maxBtn.text;
            font: maxBtn.font;
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        ToolTip.visible: maxBtn.hovered;
        ToolTip.delay: 500;
        ToolTip.text: parentObj.visibility===Window.FullScreen?qsTr("向下还原"):qsTr("最大化");

        onClicked: {
            parentObj.visibility=parentObj.visibility===Window.FullScreen?Window.Windowed:Window.FullScreen;
        }
    }
    //关闭
    Button{
        id:closeBtn;
        anchors{
            right: parent.right;
        }
        flat: true;
        font{
            family: icomoonFont.name;
            pixelSize: titleBar.height/2;
        }
        text: "\uf4e6";
        background: Rectangle{
            implicitWidth: titleBar.height;
            implicitHeight: titleBar.height;
            color: {
                if(closeBtn.pressed && closeBtn.hovered)
                    return closeBtnClickColor;
                if(closeBtn.hovered)
                    return closeBtnHoveredColor;
                else
                    return closeBtnNormalColor;
            }
        }

        contentItem: Label{
            text: closeBtn.text;
            font: closeBtn.font;
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        ToolTip.visible: closeBtn.hovered;
        ToolTip.delay: 500;
        ToolTip.text: qsTr("关闭");

        onClicked: {
            Qt.quit();
        }
    }

}
