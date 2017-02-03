#include <SPI.h>
#include <Ethernet.h>
long randomNumber;
//Ethernet setting
// the media access control (ethernet hardware) address for the shield:
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED }; 
//the IP address for the shield:
byte ip[] = { 192, 168, 1, 34 };
IPAddress dnServer(192, 168, 1, 1);
IPAddress gateway(192, 168, 1, 1);
IPAddress subnet(255, 255, 255, 0); 
char server[] = "192.168.1.31";  
char smtpServer[] = "smtpcorp.com";
EthernetClient client;

// constants won't change. They're used here to
// set pin numbers:
const int sensorPin = 2;     // the number of the pushbutton pin
const int ledPin =  9;      // the number of the LED pin
const int buzzerPin = 8;

// variables will change:
int sensorState = 0;         // variable for reading the pushbutton status
int statusPintu = 0;
int waktuBuka = 0;

void setup() {

  Serial.begin(9600);
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(sensorPin, INPUT);
  Ethernet.begin(mac, ip, dnServer, gateway, subnet);
}

void loop() {
  //generate randomNumber
  randomNumber = random(0,10000000);
  //digitalWrite(ledPin, HIGH);
  // read the state of the pushbutton value:
  sensorState = digitalRead(sensorPin);

  // check if the pushbutton is pressed.
  // if it is, the sensorState is HIGH:
  
   if (sensorState == HIGH) {
     statusPintu = 1;
     Serial.print(statusPintu);
     digitalWrite(ledPin, LOW);
     } 
     
   else {
     statusPintu = 0;
     Serial.print(statusPintu);
     digitalWrite(ledPin, HIGH);
  }

  client.stop();
  if (client.connect(server, 80)) {
        if (statusPintu == 1) {
          String request = String("GET /myprojects/opendoor/example/?id=1&status=Tutup&randNum=");
          request = String(request + randomNumber);
          client.println(request);
          client.println("Host: 192.168.1.31");
          client.println("Connection: close");
          client.println();
          Serial.println(" --> tutup");
          Serial.println("rand number : ");
          Serial.println(randomNumber);
           waktuBuka = 0;
          delay(1000);//1 detik = 1000
          } 
          else {
          String request = String("GET /myprojects/opendoor/example/?id=1&status=Buka&randNum=");
          request = String(request + randomNumber);
          client.println(request);
          client.println("Host: 192.168.1.31");
          client.println("Connection: close");
          client.println();
          Serial.println(" --> buka");
          Serial.println("rand number : ");
          Serial.println(randomNumber);
         
          waktuBuka ++;
          Serial.println(waktuBuka);
          if (waktuBuka >= 10){
            Serial.println("PINTU TERBUKA LEBIH DARI 3 JAM !!");
            email("Pintu1 di data center terbuka lebih dari 3 jam !!!");
          }
          delay(1000);
          }
  } 
    else {
       // if you didn't get a connection to the server:
        Serial.println("connection failed");
   }
}
bool email(char* text)
{
  bool success = false;
  Serial.println("Sending email...");
  if (client.connect(smtpServer, 2525)){            //2525 is SMTP Server port
    Serial.println("connected");
    delay(100);
    client.println("EHLO arduino");
    for(int i=0; i<999; ++i){
      if(client.read() > 0)
        break;
    }
    Serial.println("responded");
    client.println("AUTH LOGIN");                     //see "http://base64-encoder-online.waraxe.us/"
     client.println("YWxteQ==");                    //Type your username  and encode it
    client.println("cDRzd29yZDE=");                   //Type your password  and encode it</p>
    // Put your "from" email address here
    client.println("MAIL FROM:<olazipeng@gmail.com>"); //Seems you can write what you want here...
    for(int i=0; i<999; ++i){
      if(client.read() > 0)
        break;
    }
    client.println("RCPT TO:<almyozil.ao@gmail.com>");
    for(int i=0; i<999; ++i){
      if(client.read() > 0)
        break;
    }
    client.println("DATA");
    for(int i=0; i<999; ++i){
      if(client.read() > 0)
        break;
    }
    //Sender
    client.println("from: olazipeng@gmail.com"); //Sender address
    client.println("to: almyozil.ao@gmail.com");  //Receiver address
    client.println("SUBJECT: From your arduino");
    client.println("");
    client.println(text);
    client.println(".");
    client.println("QUIT");
    for (int i = 0; i<999; ++i){
      if(i > 998){
        Serial.println("error: No response");
      }
      if(client.read() > 0)
        break;
    }
    success = true;
    client.println();
    Serial.println("end");
  }
  else {
    Serial.println("Failed");
    client.println("QUIT"); //Disconnection
  }
  client.stop();
  return success;
}


