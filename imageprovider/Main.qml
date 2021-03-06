import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "imageprovider.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("imageprovider")

        Image {
            id: img
            anchors.centerIn: parent
            source: "image://myprovider/500/500/"
            anchors.fill: parent
            onStatusChanged: {
                if(status == Image.Ready)
                    indicator.running = false;
            }

            ActivityIndicator {
                id: indicator
                anchors.centerIn: parent
                running: false
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    indicator.running = true;
                    img.source = "image://myprovider/500/500/?seed=" + Math.random(1000)
                }
            }
        }
    }
}
