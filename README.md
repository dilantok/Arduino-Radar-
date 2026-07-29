# Arduino Radar System with Distance Alert

<p align="center">
  <img src="assets/interface.png" width="900">
</p>

A real-time Arduino radar system built with an HC-SR04 ultrasonic sensor, SG90 servo motor, Processing visualization, and a passive buzzer for proximity alerts.

---

## Features

- 📡 Real-time radar scanning
- 📏 Distance measurement using the HC-SR04 ultrasonic sensor
- 🔄 Continuous servo sweep
- 💗 Custom Processing radar interface
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
| SG90 Servo | D9 |
| Passive Buzzer | D8 |
| VCC | 5V |
| GND | GND |

---

## Software

- Arduino IDE
- Processing 4

---

## How It Works

1. The servo continuously scans between **15° and 165°**.
2. The HC-SR04 measures the distance at each angle.
3. Arduino sends data to Processing using serial communication.
4. Processing visualizes the radar sweep and detected objects in real time.
5. The passive buzzer changes its tone depending on the measured distance.

### Distance Alert

| Distance | Alert |
|----------|-------|
| 0–10 cm | High-frequency tone |
| 11–20 cm | Medium-frequency tone |
| 21–30 cm | Low-frequency tone |
| >30 cm | Silent |

---

## Project Structure

```text
Arduino-Radar/
│
├── radar.ino
├── RadarDisplay.pde
├── assets/
│   ├── interface.png
│   └── hardware.jpg
└── README.md
```

---

## Future Improvements

- OLED display integration
- RGB LED distance indicator
- Portable battery-powered version
- ESP32 wireless monitoring
- Adjustable alarm threshold
- Data logging

---
