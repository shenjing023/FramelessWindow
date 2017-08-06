/*
  主要的界面代码
  */

import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Page{
    RowLayout {
          id: layout
          anchors.fill: parent
          spacing: 6
          Rectangle {
              color: 'teal'
              Layout.fillWidth: true
              Layout.minimumWidth: 50
              Layout.preferredWidth: 100
              Layout.maximumWidth: 300
              Layout.minimumHeight: 150
              Text {
                  anchors.centerIn: parent
                  text: parent.width + 'x' + parent.height
              }
          }
          Rectangle {
              color: 'plum'
              Layout.fillWidth: true
              Layout.minimumWidth: 50
              Layout.preferredWidth: 100
              Layout.preferredHeight: 100
              Text {
                  anchors.centerIn: parent
                  text: parent.width + 'x' + parent.height
              }
          }
          Rectangle {
              color: 'red'
              Layout.fillWidth: true
              Layout.minimumWidth: 100
              Layout.preferredWidth: 200
              Layout.preferredHeight: 100
              Text {
                  anchors.centerIn: parent
                  text: parent.width + 'x' + parent.height
              }
          }
      }
}
