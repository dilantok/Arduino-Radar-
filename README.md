# Arduino Radar System with Distance Alert

<p align="center">
  <img src="assets/radarinterface.png" width="900">
</p>

A real-time radar system developed with **Arduino Uno**, an **HC-SR04 ultrasonic sensor**, an **SG90 servo motor**, and **Processing**. The system continuously scans its surroundings, visualizes detected objects on a custom radar interface, and provides audible proximity alerts using a passive buzzer.

---

## Features

- 📡 Real-time radar scanning
- 📏 Distance measurement with the HC-SR04 ultrasonic sensor
- 🔄 Continuous servo sweep (15°–165°)
- 💗 Custom Processing radar visualization
- 🔔 Passive buzzer proximity alerts
- ⚡ Live serial communication between Arduino and Processing

---

## Hardware

<p align="center">
  <img src="assets/hardware.jpg" width="600">
</p>

| Component | Arduino Pin |
|-----------|-------------|
| HC-SR04 Trig | D3 |
| HC-SR04 Echo | D2 |
| SG90 Servo Signal | D9 |
| Passive Buzzer | D8 |
| VCC | 5V |
| GND | GND |

---

## Software

- Arduino IDE
- Processing 4

---

## How It Works

1. The servo continuously sweeps between **15° and 165°**.
2. The HC-SR04 measures the distance at every angle.
3. Arduino sends the measured angle and distance to Processing through serial communication.
4. Processing displays a real-time radar interface and highlights detected objects.
5. The passive buzzer changes its tone depending on the object's distance.

### Distance Alert

| Distance | Alert |
|----------|-------|
| 0–10 cm | High-frequency tone |
| 11–20 cm | Medium-frequency tone |
| 21–30 cm | Low-frequency tone |
| Above 30 cm | Silent |

---

## Data Format

Arduino sends data to Processing using the following format:

```text
angle,distance.
```

Example:

```text
47,60.
48,59.
49,58.
```

---

## Project Structure

```text
Arduino-Radar/
│
├── radar.ino
├── RadarDisplay.pde
├── assets/
│   ├── radarinterface.png
│   └── hardware.jpg
├── README.md
```

---

## Future Improvements

- OLED display integration
- RGB LED distance indicator
- Portable battery-powered version
- ESP32 wireless monitoring
- Adjustable alarm threshold
- Data logging
- Multiple scanning modes

---

## Author

Developed by **Dilan Tok** as a personal Arduino and Processing project to explore real-time object detection, visualization, and embedded systems.
