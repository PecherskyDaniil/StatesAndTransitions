import Felgo
import QtQuick

App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    Window{
        height: 700
        width: 400
        visible: true
        id:appwin

        Rectangle{
            id:mainrec
            anchors.fill:parent

            states:[
            State {
            name: "h1"
            PropertyChanges {target:b1;opacity:1}
            PropertyChanges {target:b2;opacity:0.5}
            PropertyChanges {target:b3;opacity:0.5}
            PropertyChanges {target:headertext;text:"Page 1"}
            PropertyChanges {target:contenttext;text:"Content 1"}
            PropertyChanges {target:hb;visible:false}
            },
            State {
            name: "h2"
            PropertyChanges {target:b1;opacity:0.5}
            PropertyChanges {target:b2;opacity:1}
            PropertyChanges {target:b3;opacity:0.5}
            PropertyChanges {target:headertext;text:"Page 2"}
            PropertyChanges {target:contenttext;text:"Content 2"}
            PropertyChanges {target:hb;visible:true}
            PropertyChanges {target:hb;backstate:"h1"}

            },
            State {
            name: "h3"
            PropertyChanges {target:b1;opacity:0.5}
            PropertyChanges {target:b2;opacity:0.5}
            PropertyChanges {target:b3;opacity:1}
            PropertyChanges {target:headertext;text:"Page 3"}
            PropertyChanges {target:contenttext;text:"Content 3"}
            PropertyChanges {target:hb;visible:true}
            PropertyChanges {target:hb;backstate:"h2"}
            } ]
            transitions: Transition {
                         ColorAnimation {
                          property: "color"
                          easing.type: Easing.InOutQuad
                          duration: 1000
                          }
            }
        Rectangle{
            height:100
            width: parent.width
            color: Qt.rgba(0.4,0.4,0.4,1)
            id:header

            Rectangle{
                id:hb
                width:100
                height:100
                property string backstate:"h1"
                visible:false
                Text{
                    id:buttontext
                    text:"back"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mainrec.state=parent.backstate
                    }
                }
            }

            Text{
                id:headertext
                text:"header"
                anchors.centerIn: parent
            }
        }
        Rectangle{
            anchors.top: header.bottom
            anchors.left: parent.left
            anchors.right:parent.right
            anchors.bottom: footer.top
            anchors.margins:5
            border.color: Qt.rgba(0.2,0.2,0.2,1)
            id:content
            Text{
                id:contenttext
                text:"content"
                anchors.centerIn: parent

            }

        }
        Rectangle{
            height:100
            width: parent.width
            color: Qt.rgba(0.7,0.7,0.7,1)
            id:footer
            anchors.bottom: parent.bottom
            Rectangle{
                height:100
                width: parent.width*0.3
                color: Qt.rgba(0.5,0.5,0.5,1)
                border.color: Qt.rgba(0.2,0.2,0.2,1)

                id:b1
                anchors.left: parent.left
                Text{
                    text:"1"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mainrec.state="h1"
                    }
                }

            }
            Rectangle{
                height:100
                color: Qt.rgba(0.5,0.5,0.5,1)
                border.color: Qt.rgba(0.2,0.2,0.2,1)
                anchors.right: b3.left
                anchors.left: b1.right
                anchors.margins:5
                id:b2
                Text{
                    text:"2"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mainrec.state="h2"
                    }
                }
            }
            Rectangle{
                height:100
                width: parent.width*0.3
                color: Qt.rgba(0.5,0.5,0.5,1)
                border.color: Qt.rgba(0.2,0.2,0.2,1)
                id:b3
                anchors.right: parent.right
                Text{
                    text:"3"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mainrec.state="h3"
                    }
                }
            }
        }
    }
    }
}
