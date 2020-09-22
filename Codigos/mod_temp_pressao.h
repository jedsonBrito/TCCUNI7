void iniciarBMP280(){
  Serial.println(F("Iniciando.... BMP280 "));
  if (!bmp.begin(0x76)) {
    Serial.println(F("Sensor BMP280 não encontrado, verificar fios!"));
    while (1) delay(10);
  }
}

void setup() {
  Serial.begin(115200); 
  ThingSpeak.begin(client); 
  WiFi.mode(WIFI_STA);
  iniciarThingSpeak();
  iniciarBMP280();
}

void conectar(){
  // Conectar ou reconectar no WiFi
  if(WiFi.status() != WL_CONNECTED){
    Serial.println("Tentando conectar na Rede: "+SECRET_SSID);
    while(WiFi.status() != WL_CONNECTED){
      WiFi.begin(ssid, pass);  
      Serial.print(".");
      delay(5000);     
    } 
    Serial.println("\nConectado.");
  }
}

void loop() {
  conectar();
  temperatura = bmp.readTemperature();
  pressao = bmp.readPressure();
  ThingSpeak.setField(1, temperatura);
  ThingSpeak.setField(2, pressao);
  
  int x = ThingSpeak.writeFields(myChannelNumber, myWriteAPIKey);
  if(x == 200){
    Serial.println("Canal Atualizado com sucesso.");
  } else{
    Serial.println("Problema na atualização. Erro de código HTTP " + String(x));
  }
  delay(30000); 