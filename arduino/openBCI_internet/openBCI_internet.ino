#include <Process.h>
#include <Bridge.h>
#include <Console.h>

#define LED_PIN 13

void setup() {
  Bridge.begin();
  Console.begin();
  Serial.begin(9600);
  
  pinMode(LED_PIN, OUTPUT);
}

void loop() {
  Process p;
  p.runShellCommand("/usr/bin/curl http://one-billion-cat.com/test/openbci/index.php");
  Serial.println("run curl command");
  
  while (p.running());
    while (p.available()) {
      int result = p.parseInt();
      Serial.println(result);
      
      if (result == 1){
        digitalWrite(LED_PIN, HIGH);
      } else {
        digitalWrite(LED_PIN, LOW);
      }
    }
  delay (1000);
}
