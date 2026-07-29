# Arduino Radar System with Distance Alert

<p align="center">
  <img src="assets/radarinterface.png" width="900" alt="Arduino Radar Interface">
</p>

A real-time radar system built with **Arduino Uno**, an **HC-SR04 ultrasonic sensor**, an **SG90 servo motor**, and **Processing**. The system scans its surroundings, detects nearby objects, visualizes them on a custom radar interface, and provides audible proximity alerts using a passive buzzer.

---

## Features

- 📡 Real-time radar scanning
- 📏 Distance measurement using the HC-SR04 ultrasonic sensor
- 🔄 Continuous servo sweep from **15° to 165°**
- 💗 Custom Processing radar visualization
- 🔔 Passive buzzer proximity alerts
- ⚡ Live serial communication between Arduino and Processing

---

## Hardware

<p align="center">
  <img src="assets/hardware.jpg" width="600" alt="Hardware Setup">
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
2. The HC-SR04 ultrasonic sensor measures the distance at each angle.
3. Arduino sends the measured angle and distance to Processing via serial communication.
4. Processing visualizes the radar sweep and highlights detected objects in real time.
5. The passive buzzer changes its frequency depending on the measured distance.

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
├── assets/
│   ├── radarinterface.png
│   └── hardware.jpg
│
├── radar.ino
├── radarprocessor.pde
└── README.md
```

---

## Getting Started

1. Connect all hardware according to the wiring table.
2. Upload `radar.ino` using the Arduino IDE.
3. Close the Arduino Serial Monitor.
4. Open `radarprocessor.pde` in Processing 4.
5. Run the Processing sketch to view the live radar interface.

---

## Future Improvements

- OLED display integration
- RGB LED distance indicator
- Adjustable alarm distance
- Battery-powered portable version
- ESP32 wireless monitoring
- Data logging
- Multiple scanning modes

---

## Author

Developed by **Dilan Tok** as a personal Arduino and Processing project to explore embedded systems, sensor integration, and real-time visualization.
