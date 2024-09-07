import QtQuick
import QtQuick.Controls

import org.qfield
import org.qgis
import Theme

import "qrc:/qml" as QFieldItems

Item {
  id: plugin
  property var dashBoard: iface.findItemByObjectName('dashBoard')
  property var overlayFeatureFormDrawer: iface.findItemByObjectName('overlayFeatureFormDrawer')

  Component.onCompleted: {
    iface.addItemToPluginsToolbar(addGeometrylessFeature)
  }

  QfToolButton {
    id: addGeometrylessFeature
    bgcolor: Theme.darkGray
    iconSource: "icon.svg"
    iconColor: Theme.mainColor
    round: true

    onClicked: {
      dashBoard.ensureEditableLayerSelected();
      addFeature();
    }
  }

  function addFeature() {
    let geometry = GeometryUtils.createGeometryFromWkt('')
    let feature = FeatureUtils.createFeature(dashBoard.activeLayer, geometry)    
    overlayFeatureFormDrawer.featureModel.feature = feature
    overlayFeatureFormDrawer.state = 'Add'
    overlayFeatureFormDrawer.open()
  }
}
