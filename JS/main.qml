import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import "main.js" as Point

Window {
    width: 640
    height: 480
    visible: true

    Item{
        width: 640
        height: 480

        Canvas{
            id: canvas
            anchors.fill: parent

            onPaint: {
                var ctx = canvas.getContext('2d');
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctx.lineWidth = 2;
                ctx.strokeStyle = "black";
                ctx.fillStyle = "yellow";

                var shape = shapeSelector.currentText;

                if (shape === "Star") {
                    var starPoints = Point.getStarPoints(canvas.width / 2, canvas.height / 2, 50);
                    ctx.beginPath();
                    ctx.moveTo(starPoints[0], starPoints[1]);
                    for (var i = 2; i < starPoints.length; i += 2) {
                        ctx.lineTo(starPoints[i], starPoints[i + 1]);
                    }
                    ctx.closePath();
                    ctx.fill();
                    ctx.stroke();
                } else if (shape === "Ring") {
                    var ringPoints = Point.getRingPoints(canvas.width / 2, canvas.height / 2, 50, 10);
                    ctx.beginPath();
                    for (var i = 0; i < ringPoints.length; i += 4) {
                        ctx.moveTo(ringPoints[i], ringPoints[i + 1]);
                        ctx.lineTo(ringPoints[i + 2], ringPoints[i + 3]);
                    }
                    //ctx.closePath();
                    ctx.stroke();
                } else if (shape === "House") {
                    var housePoints = Point.getHousePoints(canvas.width / 2 - 50, canvas.height / 2 - 50, 100, 100);
                    ctx.beginPath();
                    for (var i = 0; i < housePoints.length; i += 2) {
                        ctx.lineTo(housePoints[i], housePoints[i + 1]);
                    }
                    //ctx.closePath();
                    ctx.fill();
                    ctx.stroke();
                } else if (shape === "Hourglass") {
                    var hourglassPoints = Point.getHourglassPoints(canvas.width / 2, canvas.height / 2, 100, 100);
                    ctx.beginPath();
                    for (var i = 0; i < hourglassPoints.length; i += 2) {
                        ctx.lineTo(hourglassPoints[i], hourglassPoints[i + 1]);
                    }
                    ctx.closePath();
                    ctx.fill();
                    ctx.stroke();
                }
            }
        }

        ComboBox {
            id: shapeSelector
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            width: 150
            model: ["Star", "Ring", "House", "Hourglass"]
            currentIndex: 0
            onCurrentIndexChanged: canvas.requestPaint()
        }

    }
}
