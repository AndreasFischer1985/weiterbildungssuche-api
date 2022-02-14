# Arbeitsagentur Weiterbildungssuche API 
Die Bundesagentur für Arbeit verfügt über eine der größten Datenbanken für Weiterbildungsangebote in Deutschland. Obwohl sie vollständig staatlich ist und es sich dabei um einen sehr spannenden Basisdatensatz handelt, mit dem viele Analysen möglich wären, bietet die Bundesagentur für Arbeit dafür bis heute keine offizielle API an.


## Authentifizierung
Die Authentifizierung funktioniert per OAuth 2 Client Credentials mit JWTs.
Client Credentials sind folgende:

**ClientID:** 38053956-6618-4953-b670-b4ae7a2360b1

**ClientSecret:** c385073c-3b97-42a9-b916-08fd8a5d1795

```bash
curl \
-H 'Host: rest.arbeitsagentur.de' \
-H 'Accept: */*' \
-H 'Content-Type: application/x-www-form-urlencoded; charset=utf-8' \
-H 'Accept-Language: de,en-US;q=0.7,en;q=0.3' \
-H 'User-Agent:  Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0' \
--data-binary "client_id=38053956-6618-4953-b670-b4ae7a2360b1&client_secret=c385073c-3b97-42a9-b916-08fd8a5d1795&grant_type=client_credentials" \
--compressed 'https://rest.arbeitsagentur.de/oauth/gettoken_cc'
```

Der generierte Token muss bei folgenden GET-requests an https://rest.arbeitsagentur.de/infosysbub/wbsuche/pc/v1/bildungsangebot im header als 'OAuthAccessToken' inkludiert werden.


## Weiterbildungssuche

**URL:** https://web.arbeitsagentur.de/weiterbildungssuche/suche


Die Weiterbildungssuche ermöglicht verfügbare Weiterbildungsangebote mit verschiedenen GET-Parametern zu filtern:


**Parameter:** *sw*  (Optional)

Suchwort (z.B. IT-Security%2520-%2520allgemein)


**Parameter:** *ort*  (Optional)

Ortsangabe nebst Postleitzahl und Koordinaten (z.B. Feucht_90537_11.224918_49.376701)


**Parameter:** *page* (Optional)

Seite…


**Parameter:** *size* (Optional)

Anzahl der Ergebnisse


### Filter

**Parameter:** *uk* (Optional)
- Bundesweit
- 25
- 50
- 100
- 150
- 200

Umkreis:  Bundesweit=Bundesweit, 25=25 km, 50=50 km, 100=100 km, 150=150 km, 200=200 km.

**Parameter:** *re*  (Optional)
- BW
- BY
- BE
- BB
- HB
- HH
- HE
- MV
- NI
- NW
- RP
- SL
- SN
- ST
- SH
- TH

Region/Bundesland: BW=Bade-Württemberg, BY=Bayern, BE=Berlin, BB=Brandenburg, HB=Bremen, HH=Hamburg, HE=Hessen, MV=Mecklenburg-Vorpommern, NI=Niedersachsen, NW=Nordrhei-Westfalen, RP=Rheinland-Pfalz, SL=Saarland, SN=Sachsen, ST=Sachsen-Anhalt, SH=Schleswig-Holstein, TH=Thüringen. Mehrere Komma-getrennte Angaben möglich (z.B. re=TH,BW).

**Parameter:** *bt* (Optional)
- 0
- 1
- 2
- 3
- 4
- 5

Beginntermin (0=regelmäßiger Start, 1=diesen Monat, 2=Folgemonat, 3=in zwei Monaten, 4=in drei Monaten, 5=in mehr als drei Monaten)

**Parameter:** *uz* (Optional)
- 1
- 2

Unterrichtszeit: 1=Vollzeit, 2=Teilzeit. Mehrere Komma-getrennte Angaben möglich (z.B. uz=1,2)


**Parameter:** *dauer* (Optional)
- 1,2
- 1,2,3
- 1,2,3,4
- 1,2,3,4,5
- 1,2,3,4,5,6
- 7,8,9
- 0

Dauer: 0=Auf Anfrage, 1,2=bis eine Woche, 1,2,3=bis ein Monat, 1,2,3,4=bis drei Monate, 1,2,3,4,5=bis sechs Monate, 1,2,3,4,5,6=bis ein Jahr, 7,8,9=mehr als ein Jahr


**Parameter:** *uf* (Optional)
- 101
- 102
- 103
- 104
- 105
- 201
- 202
- 203
- 204
- 206
- 301
- 302
- 303
- 304
- 401
- 402
- 403

Unterrichtsform: 101=Präsenzveranstaltung, 102=Seminar, 103=Workshop, 104=Praxistraining, 105=Sonstige Präsenzveranstaltung, 201=Virtuelles Klassenzimmer, 202=Online-Seminar, 203=Online-Coaching, 204=Selbstlernmodul, 206=Sonstige digitale Lernformen, 301=Blended Learning, 302=Combined Learning, 303=Hybrid Learning, 304=Sonstige kombinierte Lernformen,401=Fernunterricht, 402=Fernlehrgang, 403=Sonstiger Fernunterricht. Mehrere Komma-getrennte Angaben möglich (z.B. uf=101,202).


**Parameter:** *anbieter* (Optional)
Anbieter-ID (z.B. 22210). 


**Parameter:** *it* (Optional)
- RC
- RD

Integrationstyp: RC=Ausbildung Reha, RD=weiterbildung Reha. Mehrere Komma-getrennte Angaben möglich (z.B. re=RC,RD).


**Parameter:** *bg* (Optional)
- true
- false

Bildungsgutschein: true=nur Angebote mit Zulassung zur Förderung mit Bildungsgutschein anzeigen, false=nicht nur Angebote mit Zulassung zur Förderung mit Bildungsgutschein anzeigen.


### Beispiel:

```bash
wb=$(curl -m 60 -H "Host: rest.arbeitsagentur.de" \
-H "User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0" \
-H "Accept: application/json, text/plain, */*" \
-H "Accept-Language: de,en-US;q=0.7,en;q=0.3" \
-H "Accept-Encoding: gzip, deflate, br" \
-H "Origin: https://web.arbeitsagentur.de" \
-H "DNT: 1" \
-H "Connection: keep-alive" \
-H "Pragma: no-cache" \
-H "Cache-Control: no-cache" \
-H "OAuthAccessToken: $token" \
'https://rest.arbeitsagentur.de/infosysbub/wbsuche/pc/v1/bildungsangebot?orte=Feucht_90537_11.224918_49.376701&uk=Bundesweit&bg=false&page=0')
```
