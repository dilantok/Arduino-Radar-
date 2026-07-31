# Arduino Radar System with Distance Alert

## Overview

<p align="center">
  <img src="assets/radargif.gif" width="900" alt="Arduino Radar Demo">
</p>

A real-time radar system developed using **Arduino Uno**, an **HC-SR04 ultrasonic sensor**, an **SG90 servo motor**, a **passive buzzer**, and **Processing**.

The system scans its surroundings by rotating the ultrasonic sensor, measures the distance of detected objects, and visualizes the results through a custom radar interface. A buzzer provides audio feedback when objects are detected within a certain distance.

This project combines **embedded hardware**, **sensor integration**, and **real-time data visualization** to create an interactive radar system.

---

## Features

- 📡 Real-time radar scanning
- 📏 Distance measurement using HC-SR04 ultrasonic sensor
- 🔄 Continuous servo sweep from **15° to 165°**
- 💗 Custom Processing radar visualization
- 🎯 Real-time object detection and tracking
- 🔔 Passive buzzer proximity alerts
- ⚡ Serial communication between Arduino and Processing

---

## Hardware

<p align="center">
  <img src="assets/hardware.jpg" width="600" alt="Hardware Setup">
</p>

### Components

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

1. The Arduino controls the servo motor and rotates the ultrasonic sensor between **15° and 165°**.
2. At each angle, the HC-SR04 sensor measures the distance to nearby objects.
3. Arduino processes the sensor data and sends the angle and distance values to Processing through serial communication.
4. Processing receives the data and displays a live radar interface.
5. The passive buzzer changes its tone depending on the detected distance.

---

## Distance Alert System

| Distance | Buzzer Behaviour |
|----------|------------------|
| 0–10 cm | High-frequency tone |
| 11–20 cm | Medium-frequency tone |
| 21–30 cm | Low-frequency tone |
| Above 30 cm | Silent |

---

## Serial Data Format

Arduino sends data to Processing using the following format:

```
angle,distance.
```

Example:

```
45,38.
46,37.
47,36.
```

Where:

- `angle` represents the servo position
- `distance` represents the measured distance in centimeters

---

## Project Structure

```
Arduino-Radar/
│
├── assets/
│   ├── radargif.gif
│   ├── radarinterface.png
│   └── hardware.jpg
│
├── radar.ino
├── radarprocessor.pde
└── README.md
```

---

## Getting Started

### Arduino Setup

1. Connect the components according to the wiring table.
2. Open `radar.ino` using Arduino IDE.
3. Upload the code to Arduino Uno.

### Processing Setup

1. Open `radarprocessor.pde` using Processing 4.
2. Ensure the Arduino Serial Monitor is closed.
3. Run the Processing sketch.
4. The radar interface will display real-time sensor data.

---

## Future Improvements

- OLED display integration
- RGB LED distance indicator
- Portable battery-powered version
- ESP32 wireless monitoring
- Adjustable detection thresholds
- Data logging and analysis
- Multiple scanning modes

---

## Author

Developed by **Dilan Tok** as a personal project exploring embedded systems, sensor integration, and real-time visualization.
