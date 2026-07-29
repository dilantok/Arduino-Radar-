# Arduino Radar System with Distance Alert

A radar system built with **Arduino Uno**, **HC-SR04 Ultrasonic Sensor**, **SG90 Servo Motor**, and **Processing**. The servo continuously scans the environment while the ultrasonic sensor measures distances. A custom Processing interface visualizes the radar in real time, and a passive buzzer provides audible alerts when objects get too close.

---

## Features

- 📡 Real-time radar scanning
- 📏 Distance measurement using the HC-SR04 ultrasonic sensor
- 🔄 180° servo sweep
- 💗 Custom Processing radar visualization
- 🔔 Passive buzzer warning for nearby objects
- ⚡ Live serial communication between Arduino and Processing

---

## Hardware

- Arduino Uno
- HC-SR04 Ultrasonic Sensor
- SG90 Servo Motor
- Passive Buzzer
- Breadboard
- Jumper Wires

---

## Wiring

| Component | Arduino Pin |
|-----------|-------------|
| HC-SR04 Trig | D3 |
| HC-SR04 Echo | D2 |
| Servo Signal | D9 |
| Passive Buzzer | D8 |
| VCC | 5V |
| GND | GND |

---

## Software

### Arduino IDE
Upload the Arduino sketch to the board.

### Processing
Run the Processing sketch to display the radar interface.

Make sure the Arduino Serial Monitor is closed before starting Processing.

---

## How It Works

1. The servo sweeps from **15° to 165°** and back.
2. At each angle, the HC-SR04 measures the distance.
3. Arduino sends data in the format:

```
angle,distance.
```

Example:

```
90,18.
91,17.
92,16.
```

4. Processing receives the data and displays:
   - Radar sweep
   - Object position
   - Current angle
   - Current distance

5. The passive buzzer alerts the user based on distance:

| Distance | Alert |
|----------|-------|
| 0–10 cm | High frequency |
| 11–20 cm | Medium frequency |
| 21–30 cm | Low frequency |
| >30 cm | Silent |

---

## Project Structure

```
Arduino-Radar/
│
├── radar.ino
├── RadarDisplay.pde
├── README.md
└── assets/
```

---

## Future Improvements

- OLED display support
- RGB LED distance indicator
- Battery-powered portable version
- Multiple scanning modes
- Adjustable alarm threshold
- Data logging
- ESP32 Wi-Fi monitoring

---

## Preview

Example:

```
assets/radar-demo.gif
assets/interface.png
```

---

## License

This project is open source and available under the MIT License.
