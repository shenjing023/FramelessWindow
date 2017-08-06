import QtQuick 2.7

MouseArea{
    property var clickPos;
    property int type:1;
    property QtObject parentObj;
    width: 5
    height: 5
    cursorShape: {
        switch(type){
        case 1:
        case 2:
            return Qt.SizeVerCursor;
        case 3:
        case 4:
            return Qt.SizeHorCursor;
        case 5:
        case 8:
            return Qt.SizeFDiagCursor;
        case 6:
        case 7:
            return Qt.SizeBDiagCursor;
        }
    }
    onPressed: {
        clickPos = Qt.point(mouse.x,mouse.y);
    }

    onPositionChanged: {
        resizeWindow(Qt.point(mouse.x-clickPos.x,mouse.y-clickPos.y),type);
    }

    function resizeWindow(spacing,type){
        switch(type){
        case 1:
            //上
            parentObj.setY((parentObj.height-spacing.y)>minHeight?(parentObj.y+spacing.y):parentObj.y);
            parentObj.setHeight((parentObj.height-spacing.y)>minHeight?(parentObj.height-spacing.y):minHeight);
            break;
        case 2:
            //下
            parentObj.setHeight((parentObj.height+spacing.y)>minHeight?(parentObj.height+spacing.y):minHeight);
            break;
        case 3:
            //左
            parentObj.setX((parentObj.width-spacing.x)>minWidth?(parentObj.x+spacing.x):parentObj.x);
            parentObj.setWidth((parentObj.width-spacing.x)>minWidth?(parentObj.width-spacing.x):minWidth);
            break;
        case 4:
            //右
            parentObj.setWidth((parentObj.width+spacing.x)>minWidth?(parentObj.width+spacing.x):minWidth);
            break;
        case 5:
            //左上
            parentObj.setX((parentObj.width-spacing.x)>minWidth?(parentObj.x+spacing.x):parentObj.x);
            parentObj.setY((parentObj.height-spacing.y)>minHeight?(parentObj.y+spacing.y):parentObj.y);
            parentObj.setWidth((parentObj.width-spacing.x)>minWidth?(parentObj.width-spacing.x):minWidth);
            parentObj.setHeight((parentObj.height-spacing.y)>minHeight?(parentObj.height-spacing.y):minHeight);
            break;
        case 6:
            //右上
            parentObj.setY((parentObj.height-spacing.y)>minHeight?(parentObj.y+spacing.y):parentObj.y);
            parentObj.setWidth((parentObj.width+spacing.x)>minWidth?(parentObj.width+spacing.x):minWidth);
            parentObj.setHeight((parentObj.height-spacing.y)>minHeight?(parentObj.height-spacing.y):minHeight);
            break;
        case 7:
            //左下
            parentObj.setX((parentObj.width-spacing.x)>minWidth?(parentObj.x+spacing.x):parentObj.x);
            parentObj.setWidth((parentObj.width-spacing.x)>minWidth?(parentObj.width-spacing.x):minWidth);
            parentObj.setHeight((parentObj.height+spacing.y)>minHeight?(parentObj.height+spacing.y):minHeight);
            break;
        case 8:
            //右下
            parentObj.setWidth((parentObj.width+spacing.x)>minWidth?(parentObj.width+spacing.x):minWidth);
            parentObj.setHeight((parentObj.height+spacing.y)>minHeight?(parentObj.height+spacing.y):minHeight);
            break;
        }
    }
}
