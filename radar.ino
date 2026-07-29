#include <Servo.h>

const byte trigPin = 3;
const byte echoPin = 2;
const byte servoPin = 9;
const byte buzzerPin = 8;

Servo myServo;

void setup() {
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(buzzerPin, OUTPUT);

  digitalWrite(trigPin, LOW);
  noTone(buzzerPin);

  Serial.begin(9600);

  myServo.attach(servoPin);
  myServo.write(15);

  delay(1000);
}

void loop() {
  for (int angle = 15; angle <= 165; angle += 2) {
    moveAndMeasure(angle);
  }

  for (int angle = 165; angle >= 15; angle -= 2) {
    moveAndMeasure(angle);
  }
}

void moveAndMeasure(int angle) {
  myServo.write(angle);
  delay(50);

  int distance = calculateDistance();

  // Buzzer kontrolü
  if (distance <= 10) {
    tone(buzzerPin, 2200);
  }
  else if (distance <= 20) {
    tone(buzzerPin, 1500);
  }
  else if (distance <= 30) {
    tone(buzzerPin, 1000);
  }
  else {
    noTone(buzzerPin);
  }

  // Processing'e veri gönder
  Serial.print(angle);
  Serial.print(",");
  Serial.print(distance);
  Serial.print(".");
}

int calculateDistance() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(3);

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);

  digitalWrite(trigPin, LOW);

  unsigned long duration = pulseIn(echoPin, HIGH, 30000);

  if (duration == 0) {
    return 100;
  }

  int distance = duration * 0.0343 / 2.0;

  if (distance < 2 || distance > 100) {
    return 100;
  }

  return distance;
}
