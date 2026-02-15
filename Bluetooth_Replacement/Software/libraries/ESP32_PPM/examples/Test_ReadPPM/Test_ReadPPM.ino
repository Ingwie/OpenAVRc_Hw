 #include "ESP32_PPM.h"

void setup()
{
  Serial.begin(115200);
  delay(1000);

  Serial.println("PPM RX test...");

  // GPIO 4
  // 8 canaux
  // RISING edge
  // Sync gap = 3500 µs
  Cppm32.beginRx(4, 8, true, 3500);
}

void loop()
{
  // Nouvelle trame reçue ?
  if (Cppm32.rxAvailable())
  {
    Serial.print("CH: ");

    for (uint8_t ch = 1; ch <= 8; ch++)
    {
      uint16_t val = Cppm32.rxRead(ch);
      Serial.print(val);
      Serial.print(" ");
    }

    Serial.println();
  }
}