function getStarPoints(centerX, centerY, radius) {
  var angle = Math.PI / 5;
  var points = [];

  for (var i = 0; i < 10; i++) {
    var r = (i % 2 === 0) ? radius : radius * 0.4;
    var currX = centerX + Math.cos(i * angle) * r;
    var currY = centerY + Math.sin(i * angle) * r;
    points.push(currX, currY);
  }

  return points;
}

function getRingPoints(centerX, centerY, radius, thickness){
    var points = [];
    var innerRadius = radius - thickness;

    for(var angle=0; angle < 2*Math.PI; angle+=0.01){
        var outerX = centerX + Math.cos(angle) * radius;
        var outerY = centerY + Math.sin(angle) * radius;
        var innerX = centerX + Math.cos(angle) * innerRadius;
        var innerY = centerY + Math.sin(angle) * innerRadius;

        points.push(outerX, outerY, innerX, innerY);
    }

    return points;
}


function getHousePoints(topLeftX, topLeftY, width, height) {
  var points = [];
  var roofHeight = height * 0.4;
  var doorHeight = height * 0.6;


  points.push(topLeftX, topLeftY)
  points.push(topLeftX + width / 2, topLeftY - roofHeight);
  points.push(topLeftX + width, topLeftY);
  points.push(topLeftX, topLeftY)


  points.push(topLeftX, topLeftY + height);
  points.push(topLeftX + width, topLeftY + height);
  points.push(topLeftX + width, topLeftY);

  return points;
}


function getHourglassPoints(centerX, centerY, width, height) {
  var points = [];
  var halfWidth = width / 2;


  points.push(centerX, centerY);
  points.push(centerX - halfWidth, centerY - height);
  points.push(centerX + halfWidth, centerY - height);
  points.push(centerX, centerY);

    points.push(centerX, centerY);
    points.push(centerX + halfWidth, centerY + height);
    points.push(centerX - halfWidth, centerY + height);
    points.push(centerX, centerY);

  return points;
}
