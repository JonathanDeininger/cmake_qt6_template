import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: "Hover Button Beispiel"
	Rectangle {
		id: textRect
		width: 200
		height: 100
		anchors.centerIn: parent
		color: "red"

		Text {
			text: "Hello World"
			anchors.centerIn: parent
			color: "white"
			font.pixelSize: 20
		}
	}

    Rectangle {
        id: buttonRect  // ID für das Rechteck, um es einfacher referenzieren zu können
        width: 200
        height: 100
        anchors.centerIn: parent  // Zentriert das Rechteck im Anwendungsfenster
        radius: 10  // Ecken abrunden

        // Definiere die Farben für den Button
        property color defaultColor: "#3498db"  // Standardfarbe
        property color hoverColor: "#e2b35d"  // Farbe bei Hover

        color: defaultColor  // Setze die Anfangsfarbe des Rechtecks

        // MouseArea für Hover- und Klick-Events
        MouseArea {
            id: buttonArea  // ID für die MouseArea
            anchors.fill: parent  // Füllt den gesamten Raum des Rechtecks aus
            hoverEnabled: true  // Ermöglicht Hover-Events

            onClicked: {
                console.log("Button wurde geklickt!")  // Logge eine Nachricht, wenn der Button geklickt wird
            }

            onEntered: {
                // Wenn die Maus über das Rechteck fährt, ändere die Farbe
                colorAnimation.to = buttonRect.hoverColor;  // Ziel-Farbe setzen
                colorAnimation.start();  // Animation starten
            }

            onExited: {
                // Wenn die Maus das Rechteck verlässt, ändere die Farbe zurück
                colorAnimation.to = buttonRect.defaultColor;  // Ziel-Farbe zurücksetzen
                colorAnimation.start();  // Animation starten
            }
        }

        // Farb-Animation
        ColorAnimation {
            id: colorAnimation  // ID für die Farb-Animation
            target: buttonRect  // Setze das Ziel der Animation auf das Rechteck
            property: "color"  // Die Eigenschaft, die animiert werden soll
            duration: 200  // Dauer der Animation in Millisekunden
            onFinished: {
                console.log("Animation beendet!");  // Logge eine Nachricht, wenn die Animation beendet ist
            }
        }

        // Text im Button
        Text {
            text: "Hover Button"  // Text, der auf dem Button angezeigt wird
            anchors.centerIn: parent  // Zentriert den Text im Rechteck
            color: "white"  // Textfarbe
            font.pixelSize: 20  // Schriftgröße
        }
    }
}
