from __future__ import print_function
import paho.mqtt.publish as publish
import psutil
import serial
import time
arduinoData = serial.Serial("/dev/tty.usbmodem14101",9600,write_timeout=2,timeout=2);

channelID = "1072373"
apiKey = "75Y#########4"

useUnsecuredTCP = False
useUnsecuredWebsockets = False
useSSLWebsockets = True

mqttHost = "mqtt.thingspeak.com"

if useUnsecuredTCP:
    tTransport = "tcp"
    tPort = 1883
    tTLS = None

if useUnsecuredWebsockets:
    tTransport = "websockets"
    tPort = 80
    tTLS = None

if useSSLWebsockets:
    import ssl
    tTransport = "websockets"
    tTLS = {'ca_certs':"/etc/ssl/certs/ca-certificates.crt",'tls_version':ssl.PROTOCOL_TLSv1}
    tPort = 443
        
topic = "channels/" + channelID + "/publish/" + apiKey

def realizar_mensuração(comando):
  arduinoData.write()
  medida = arduinoData.readline().decode('ascii') 
  return medida 

def espera(segundos):
    time.sleep(segundos) 

while(True):
    
    temperatura = realizar_mensuração(b't')
    pressao = realizar_mensuração(b'p')
    umidade = realizar_mensuração(b'u')
    dir_vento = realizar_mensuração(b'd')
    vel_vento = realizar_mensuração(b'a')
    print (" Temp =",temperatura,"   Press =",pressao,"   Umidade",umidade," Velocidade do Vento",vel_vento,"Direção do Vento",dir_vento)

    tPayload = "field1=" + str(pressao) + "&field2=" + str(umidade) + "&field3=" + str(dir_vento) +  "&field4=" + str(temperatura) +  "&field5=" + str(vel_vento)

    try:
        publish.single(topic, payload=tPayload, hostname=mqttHost, port=tPort, tls=tTLS, transport=tTransport)
        espera(30)

    except (KeyboardInterrupt):
        break

    except:
        print ("Erro ao publicar os dados.")
