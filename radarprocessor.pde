import processing.serial.*;

Serial myPort;

int angle = 0;
int distance = 100;

String incomingData = "";

final int MAX_DISTANCE = 100;

void setup() {
  size(1200, 700);
  smooth(8);

  println("Bulunan seri portlar:");

  String[] ports = Serial.list();

  for (int i = 0; i < ports.length; i++) {
    println(i + " : " + ports[i]);
  }

  String selectedPort = "";

  for (int i = 0; i < ports.length; i++) {
    if (ports[i].contains("usbmodem")) {
      selectedPort = ports[i];
      break;
    }
  }

  if (selectedPort.equals("")) {
    println("Arduino portu bulunamadı.");
    println("Serial Monitor kapalı mı kontrol et.");
    exit();
  }

  println("Arduino portu bulundu: " + selectedPort);

  myPort = new Serial(this, selectedPort, 9600);
  myPort.clear();

  // Arduino verisi: açı,mesafe.
  myPort.bufferUntil('.');
}

void draw() {
  background(18, 5, 22);

  drawGlow();
  drawRadar();
  drawSweepLine();
  drawDetectedObject();
  drawInformationPanel();
}

void serialEvent(Serial port) {
  String data = port.readStringUntil('.');

  if (data == null) {
    return;
  }

  data = trim(data);
  data = data.replace(".", "");

  String[] values = split(data, ',');

  if (values.length != 2) {
    return;
  }

  try {
    int receivedAngle = int(trim(values[0]));
    int receivedDistance = int(trim(values[1]));

    if (receivedAngle >= 0 && receivedAngle <= 180) {
      angle = receivedAngle;
    }

    if (receivedDistance >= 0) {
      distance = receivedDistance;
    }
  }
  catch(Exception e) {
    println("Hatalı veri: " + data);
  }
}

void drawGlow() {
  noStroke();

  for (int i = 300; i > 0; i -= 20) {
    float alphaValue = map(i, 300, 0, 0, 12);
    fill(255, 60, 180, alphaValue);
    ellipse(width / 2, height - 70, i * 3.2, i * 1.1);
  }
}

void drawRadar() {
  pushMatrix();

  translate(width / 2, height - 70);

  strokeCap(ROUND);
  noFill();

  // Radar dış yayları
  for (int radius = 120; radius <= 500; radius += 95) {
    stroke(255, 80, 190, 125);
    strokeWeight(2);

    arc(
      0,
      0,
      radius * 2,
      radius * 2,
      PI,
      TWO_PI
    );
  }

  // Merkez çizgisi
  stroke(255, 120, 210, 150);
  strokeWeight(2);
  line(-520, 0, 520, 0);

  // Açı çizgileri
  for (int a = 0; a <= 180; a += 30) {
    float radarAngle = radians(180 + a);

    float x = cos(radarAngle) * 520;
    float y = sin(radarAngle) * 520;

    stroke(255, 80, 190, 100);
    strokeWeight(2);
    line(0, 0, x, y);
  }

  // Mesafe etiketleri
  fill(255, 165, 220);
  textAlign(CENTER, CENTER);
  textSize(16);

  text("25 cm", 0, -125);
  text("50 cm", 0, -220);
  text("75 cm", 0, -315);
  text("100 cm", 0, -410);

  // Açı etiketleri
  fill(255, 145, 215);
  textSize(15);

  for (int a = 0; a <= 180; a += 30) {
    float radarAngle = radians(180 + a);

    float x = cos(radarAngle) * 550;
    float y = sin(radarAngle) * 550;

    pushMatrix();
    translate(x, y);

    if (a < 90) {
      rotate(radarAngle - PI);
    } else if (a > 90) {
      rotate(radarAngle);
    }

    text(a + "°", 0, 0);
    popMatrix();
  }

  popMatrix();
}

void drawSweepLine() {
  pushMatrix();

  translate(width / 2, height - 70);

  float sweepAngle = radians(180 + angle);

  // Tarama gölgesi
  for (int i = 35; i > 0; i--) {
    float fadedAngle = sweepAngle - radians(i * 0.7);

    float x = cos(fadedAngle) * 510;
    float y = sin(fadedAngle) * 510;

    stroke(
      255,
      40,
      175,
      map(i, 35, 0, 0, 90)
    );

    strokeWeight(2);
    line(0, 0, x, y);
  }

  // Ana tarama çizgisi
  float x = cos(sweepAngle) * 520;
  float y = sin(sweepAngle) * 520;

  stroke(255, 90, 210);
  strokeWeight(4);
  line(0, 0, x, y);

  // Merkez noktası
  noStroke();
  fill(255, 130, 220);
  ellipse(0, 0, 16, 16);

  popMatrix();
}

void drawDetectedObject() {
  if (distance <= 0 || distance >= MAX_DISTANCE) {
    return;
  }

  pushMatrix();

  translate(width / 2, height - 70);

  float radarAngle = radians(180 + angle);

  float objectRadius = map(
    distance,
    0,
    MAX_DISTANCE,
    0,
    500
  );

  float objectX = cos(radarAngle) * objectRadius;
  float objectY = sin(radarAngle) * objectRadius;

  // Nesne parlaması
  noStroke();

  for (int sizeValue = 70; sizeValue >= 10; sizeValue -= 10) {
    fill(
      255,
      40,
      135,
      map(sizeValue, 70, 10, 5, 150)
    );

    ellipse(
      objectX,
      objectY,
      sizeValue,
      sizeValue
    );
  }

  // Nesnenin merkezi
  fill(255, 40, 110);
  ellipse(objectX, objectY, 14, 14);

  popMatrix();
}

void drawInformationPanel() {
  // Üst başlık
  fill(255, 130, 220);
  textAlign(CENTER, CENTER);
  textSize(34);
  text("ARDUINO RADAR", width / 2, 38);

  fill(255, 185, 230);
  textSize(15);
  text(
    "HC-SR04 Ultrasonik Tarama Sistemi",
    width / 2,
    72
  );

  // Sol bilgi kutusu
  noStroke();
  fill(48, 12, 55, 220);
  rect(30, 30, 250, 130, 18);

  fill(255, 145, 215);
  textAlign(LEFT, CENTER);
  textSize(18);

  text("Açı: " + angle + "°", 55, 70);

  if (distance >= MAX_DISTANCE || distance <= 0) {
    text("Mesafe: Menzil dışında", 55, 108);
  } else {
    text("Mesafe: " + distance + " cm", 55, 108);
  }

  // Sağ durum kutusu
  fill(48, 12, 55, 220);
  rect(width - 280, 30, 250, 130, 18);

  fill(255, 145, 215);
  textAlign(LEFT, CENTER);
  textSize(18);
  text("Durum:", width - 255, 70);

  if (distance > 0 && distance < MAX_DISTANCE) {
    fill(255, 70, 140);
    text("NESNE ALGILANDI", width - 255, 108);
  } else {
    fill(180, 130, 175);
    text("Tarama yapılıyor", width - 255, 108);
  }

  // Alt bilgi
  fill(255, 160, 220);
  textAlign(CENTER, CENTER);
  textSize(14);
  text(
    "Maksimum algılama mesafesi: " + MAX_DISTANCE + " cm",
    width / 2,
    height - 22
  );
}
