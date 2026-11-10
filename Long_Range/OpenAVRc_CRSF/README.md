# ExpressLRS — Switch Mode / Switch Configuration

> English adaptation of the ExpressLRS **Switch Configs** documentation.  
> Source: https://www.expresslrs.org/software/switch-config/  
> Page consulted on October 30, 2026.  
> The content below follows the organization, technical concepts, and tables of the documentation, with rewritten wording.

## Important warning — Arming

If you use **`Arm using CH5`**, place the arming switch on **AUX1 / Channel 5**:

- approximately **1000 µs = disarmed**
- approximately **2000 µs = armed**

The selected *Switch Mode* directly affects the resolution and update rate of the auxiliary channels. It is therefore an important CRSF/ExpressLRS setting, especially for arming.

---

# Switch configuration mode summary

| Channel | Flight controller side | Hybrid | Wide | Full Res 8ch | Full Res 16ch Rate/2 | Full Res 12ch Mixed |
|---:|---|---|---|---|---|---|
| 1 | Sticks | Normal Range | Normal Range | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits |
| 2 | Sticks | Normal Range | Normal Range | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits |
| 3 | Sticks | Normal Range | Normal Range | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits |
| 4 | Sticks | Normal Range | Normal Range | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits |
| 5 | AUX1 | 2-pos **Arm** | 2-pos **Arm** | CRSF Ext Limits — **Arm*** | CRSF Ext Limits **H** — **Arm*** | CRSF Ext Limits **H** — **Arm*** |
| 6 | AUX2 | 6-pos **RR** | 64-pos **RR** | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 7 | AUX3 | 6-pos **RR** | 64-pos **RR** | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 8 | AUX4 | 6-pos **RR** | 64-pos **RR** | CRSF Ext Limits | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 9 | AUX5 | 6-pos **RR** | 64-pos **RR** | — | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 10 | AUX6 | 6-pos **RR** | 64-pos **RR** | — | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 11 | AUX7 | 6-pos **RR** | 64-pos **RR** | — | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 12 | AUX8 | 16-pos **RR** | 64-pos **RR** | — | CRSF Ext Limits **H** | CRSF Ext Limits **H** |
| 13 | AUX9 | — | — | — | CRSF Ext Limits **H** | — |
| 14 | AUX10 | 2-pos **Arm*** | 2-pos **Arm*** | 2-pos **Arm*** | CRSF Ext Limits **H** | 2-pos **Arm*** |
| 15 | AUX11 | LQ% | LQ% | LQ% | CRSF Ext Limits **H** | LQ% |
| 16 | AUX12 | RSSI% | RSSI% | RSSI% | CRSF Ext Limits **H** | RSSI% |
|  | **Packet Rates** | 50 to F1000 | 50 to F1000 | Full Res only | Full Res only | Full Res only |

**\***: behavior related to changes introduced with ExpressLRS 4.0 and the newer arming methods.  
**H**: *Half Rate*, channel transmitted at half the selected Packet Rate.  
**RR**: *Round Robin*, affected channels are transmitted in sequence.

---

## Channel resolution / number of positions

| Label | Description |
|---|---|
| **Normal Range** | 10-bit resolution, 1024 positions, converted to approximately **988 to 2012 µs**. One step is roughly 1 µs. |
| **CRSF Ext Limits** | 10-bit resolution, 1024 positions, converted to approximately **885 to 2115 µs**. One step is approximately **1.23046875 µs**. |
| **64-pos** | 6-bit resolution. Suitable for flight modes, flaps, landing gear, selectors, etc. |
| **16-pos** | 4-bit resolution. Suitable for flight modes, flaps, landing gear, selectors, etc. |
| **6-pos** | 3-bit resolution. Suitable for flight modes, flaps, landing gear, selectors, etc. |
| **2-pos** | 1-bit resolution, mainly intended for arming: approximately **1000 µs disarmed** and **2000 µs armed**. |
| **LQ%** | `RQly` link quality represented as a value from approximately **988 to 2012 µs**. |
| **RSSI%** | RSSI in dBm converted to a percentage (`1RSS/2RSS`), represented from approximately **988 to 2012 µs**. |

### Arm using CH5 reminder

With **`Arm using CH5`**, arming must be assigned to **AUX1 / CH5**, with:

- ~1000 µs: disarmed
- ~2000 µs: armed

### ExpressLRS 3.x and PWM output 5

On a receiver with PWM outputs, if **PWM output 5** needs to be used for a servo, landing gear, etc., another channel must be remapped to that output in the receiver Wi‑Fi interface.

In ExpressLRS 3.x, Mixer CH5 remains reserved for transmitter arming and stays a 2-position channel.

Starting with ExpressLRS 4.x, this restriction is no longer required in **Full Res** modes: Channel 5 can become a full proportional channel like the others.

---

# Channel update rate and Packet Rate

| Label | Description |
|---|---|
| **Bold in the original table** | The channel is included in every packet. Example: Packet Rate 150 Hz → channel update rate 150 Hz. |
| **H — Half Rate** | Half of the channels are sent in each packet. Effective update rate is therefore `Packet Rate / 2`. Example: 100 Hz → 50 Hz per channel. |
| **RR — Round Robin** | Channels are transmitted one after another. In the example given by ExpressLRS, at 150 Hz a given auxiliary channel may be updated roughly every 7 packets, or about 22 Hz. |
| **50 to F1000** | **Hybrid** and **Wide** are available with Packet Rates 50 Hz, 150 Hz, 250 Hz, 500 Hz, D250, D500, F500, and F1000. |
| **Full Res only** | **Full Res 8ch**, **16ch Rate/2**, and **12ch Mixed** are available with **100 Hz Full** and **333 Hz Full** Packet Rates. |

---

# Detailed Switch Mode description

> *Switch Mode* can only be changed when no receiver is connected to the transmitter and the transmitter is not armed.

The setting can be changed from the Lua configuration under EdgeTX/OpenTX or from the built-in interface of the transmitter module when available.

ExpressLRS currently provides the following switch mode families:

- **Hybrid**
- **Wide**
- **Full Res 8ch**
- **Full Res 16ch Rate/2**
- **Full Res 12ch Mixed**

---

# Hybrid and Wide

These two modes are available with the following Packet Rates:

- 50 Hz
- 150 Hz
- 250 Hz
- 500 Hz
- D250
- D500
- F500
- F1000

## Channels 1 to 4

The sticks, **CH1 to CH4**, are transmitted in every packet.

They use **10-bit / 1024-position** resolution over the **988 to 2012 µs** range, corresponding to the normal `-100%` to `+100%` range in EdgeTX/OpenTX.

## Channel 5 / AUX1 — Arm

The first switch, **CH5 / AUX1**, is transmitted in **every packet**.

ExpressLRS strongly recommends assigning the arming function to this channel. This state is also used to enable various protection and performance behaviors within the system.

In Hybrid/Wide, this channel is normally used as:

- **1 bit**
- **2 positions**
- ~1000 µs: disarmed
- ~2000 µs: armed

## Channels 6 to 12 — Round Robin

The remaining switches are sent using **Round Robin**: one auxiliary channel is inserted into a packet, then the next one is sent in the following packet.

---

## Hybrid — AUX2 to AUX7 / CH6 to CH11

These channels use **3-bit / 6-position** resolution.

They can be used with 2-position, 3-position, or 6-position switches.

| 2-pos switch | 3-pos switch | 6-pos switch | Approx. channel input (µs) | Channel output (µs) | ArduPilot mode |
|---:|---:|---:|---:|---:|---|
| 1 | 1 | 1 | 988 | 1000 | Mode 1 — upper position for a 2/3-position switch |
|  |  | 2 | 1192 | 1275 | Mode 2 |
|  |  | 3 | 1398 | 1425 | Mode 3 |
|  | 2 | — | 1500 | 1500 | Mode 4 — center position of a 3-position switch |
|  |  | 4 | 1602 | 1575 | Mode 4 |
|  |  | 5 | 1807 | 1725 | Mode 5 |
| 2 | 3 | 6 | 2012 | 2000 | Mode 6 — lower position for a 2/3-position switch |

---

## Hybrid — AUX8 / CH12

AUX8 / CH12 uses **4-bit / 16-position** resolution.

The complete Round Robin switch set requires 7 packets before the cycle returns to AUX2.

This channel can be used, for example, to combine many operating modes or to create a low-resolution multi-position control.

There is no exact 1500 µs center position in a 16-position quantization. A 3-position switch assigned to AUX8 may therefore produce approximately **1533 µs** at the center position on the flight controller side.

| Position | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| **Approx. input (µs)** | 988 | 1056 | 1125 | 1193 | 1261 | 1329 | 1398 | 1466 | 1534 | 1602 | 1671 | 1739 | 1807 | 1875 | 1944 | 2012 |
| **Output (µs)** | 1000 | 1066 | 1133 | 1200 | 1266 | 1333 | 1400 | 1467 | 1533 | 1600 | 1666 | 1733 | 1800 | 1866 | 1933 | 2000 |

---

# Wide

In **Wide** mode, AUX2 to AUX8 / CH6 to CH12 use **6-bit / 64-position** resolution.

It takes 8 packets to complete the full cycle before returning to AUX2. The eighth slot is also used to transmit additional information to the receiver, including the current TX power.

### ExpressLRS 3.x behavior

In ExpressLRS 3.x:

- Wide uses **64 positions** with telemetry ratios `1:2` and `1:4`;
- with other telemetry ratios, Wide may use **128 positions**.

### ArduPilot and Wide

With ArduPilot, the levels from a 6-position selector do not always line up perfectly with the standard `988–2012 µs` range.

The ExpressLRS documentation recommends, when necessary, adjusting the channel output limits in EdgeTX/OpenTX to approximately:

- minimum: **-75%**
- maximum: **+75%**

This gives a better distribution across the six ArduPilot flight modes.

---

# Full Resolution modes

The **Full Resolution** modes are only available with:

- **100 Hz Full**
- **333 Hz Full**

They use **10-bit / 1024-position** channels with the **CRSF Extended Limits range: 885 to 2115 µs**.

## ExpressLRS 4.0

| Mode | Behavior |
|---|---|
| **Full Res 8ch** | CH1 to CH8 are transmitted at 10-bit resolution at the full selected Packet Rate. |
| **Full Res 16ch Rate/2** | All 16 channels are transmitted at 10-bit resolution, each at half the selected Packet Rate. |
| **Full Res 12ch Mixed** | CH1 to CH4 are transmitted at 10-bit resolution at the full Packet Rate. CH5 to CH12 are transmitted at 10-bit resolution at half rate. |

## ExpressLRS 3.x

| Mode | Behavior |
|---|---|
| **Full Res 8ch** | CH1 to CH4 and CH6 to CH9 are transmitted at 10-bit resolution at the full Packet Rate. CH5 / AUX1 remains a 1-bit / 2-position arming channel. |
| **Full Res 16ch Rate/2** | All channels are transmitted at 10-bit resolution at half rate. |
| **Full Res 12ch Mixed** | CH1 to CH4 are transmitted at 10-bit resolution, CH5 / AUX1 remains a 1-bit Arm channel at full rate, and CH6 to CH13 are transmitted at 10-bit resolution at half rate. |

---

# FAQ

## Why is the Arm state so important?

The ExpressLRS transmitter and receiver do not behave exactly the same when they are **armed** and **disarmed**.

When disarmed, ExpressLRS can prioritize certain configuration operations so that Lua and parameter changes remain responsive.

Once armed, several protections and performance optimizations become active.

### Protections enabled while armed

Some functions that could disturb the radio link are blocked, including:

- buttons on external TX modules;
- joystick / 5-way control on external TX modules;
- *Bump to Share*;
- *VTX Admin*;
- built-in VTX channel changes.

These restrictions prevent a configuration operation from interfering with OTA traffic and causing a link interruption or failsafe.

### Performance features linked to Arm state

When the system is armed:

- **Dynamic Power** can operate fully;
- loss of a telemetry packet may push TX power to maximum;
- a sudden disconnect or failsafe may also force maximum transmit power;
- **Race Telemetry** may disable telemetry so that every packet is dedicated to control;
- some modules may enable temperature-based fan regulation.

---

## Why does ExpressLRS recommend AUX1 / CH5 for Arm?

AUX1 is transmitted **in every packet** in the modes where it is used for arming.

It is therefore the most reliable channel for immediately transmitting the disarm command.

If arming were placed on a Round Robin channel, several packets could pass before the new state is transmitted. When link quality is poor, the particular packet carrying that auxiliary channel could also be lost.

With Arm on AUX1, receiving any valid packet containing this information allows the arming state to be updated immediately.

ExpressLRS therefore recommends:

- **AUX1 / CH5**
- ~1000 µs = disarmed
- ~2000 µs = armed

---

## Can a 3-position switch be used for Arm?

Yes.

The mix in EdgeTX/OpenTX should be configured so that the AUX1 channel seen by ExpressLRS behaves like a **2-position ON/OFF** control.

If the third physical switch position is also used for another function, the same physical switch can be sent on a second channel for that extra function.

---

## What happened to the old 1-bit “Normal” mode?

ExpressLRS 1.0 provided a **Normal** mode with eight 1-bit switches transmitted in every packet.

This mode was removed starting with ExpressLRS 2.0, mainly because it was rarely used and the Flash space could be used for other features.

The recommended modes are now **Hybrid**, **Wide**, or one of the **Full Resolution** modes.

---

## Why does Switch Mode return to its previous value after changing it in Lua?

This behavior is intentional.

*Switch Mode* can only be changed when:

1. the receiver is **not connected** to the transmitter;
2. the transmitter is **not armed**.

This restriction ensures that TX and RX always interpret switch data using the same format.

Recommended procedure:

1. power off the receiver;
2. wait for the **Telemetry Lost** announcement;
3. change **Switch Mode**;
4. power the receiver back on.

At the next startup, TX and RX perform their configuration exchange using the new mode.

---

# Important point for OpenAVRc / CRSF integration

For a complete CRSF interface, **Switch Mode must be exposed as a configurable ExpressLRS module parameter**.

The available choices depend on factors including:

- ExpressLRS version;
- selected Packet Rate;
- receiver connection state;
- Arm/Disarm state;
- TX module capabilities.

*Switch Mode* must therefore not be treated as a simple display preference: it changes the actual encoding and transmission behavior of auxiliary channels.
