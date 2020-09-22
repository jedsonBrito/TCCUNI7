#include "ThingSpeak.h"
#include "secrets.h"
#include <ESP8266WiFi.h>
#include <Wire.h>
#include <SPI.h>
#include <Adafruit_BMP280.h>

char ssid[] = SECRET_SSID;   
char pass[] = SECRET_PASS;   
WiFiClient  client;
unsigned long myChannelNumber = SECRET_CH_ID;
const char * myWriteAPIKey = SECRET_WRITE_APIKEY;
Adafruit_BMP280 bmp;
float temperatura,pressao = 0;