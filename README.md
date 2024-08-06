# Arbeitsagentur Weiterbildungssuche API 
Die Bundesagentur für Arbeit verfügt über eine der größten Datenbanken für Weiterbildungsangebote in Deutschland. Obwohl sie vollständig staatlich ist und es sich dabei um einen sehr spannenden Basisdatensatz handelt, mit dem viele Analysen möglich wären, bietet die Bundesagentur für Arbeit dafür bis heute keine offizielle API an.


## Authentifizierung
Die Authentifizierung funktioniert über die clientId der Weiterbildungssuche, die einem GET-request an https://web.arbeitsagentur.de/weiterbildungssuche/suche entnommen werden kann:

clientId: infosysbub-wbsuche

Bei folgenden GET-requests ist die clientId als Header-Parameter 'X-API-Key' zu übergeben.

## Weiterbildungssuche

**URL:** https://rest.arbeitsagentur.de/infosysbub/wbsuche/pc/v2/bildungsangebot


Die Weiterbildungssuche ermöglicht verfügbare Weiterbildungsangebote mit verschiedenen GET-Parametern zu filtern.

Analog dazu gibt es auch einen Endpunkt https://rest.arbeitsagentur.de/infosysbub/wbsuche/pc/v1/facetten.

### Filter


**Parameter:** *page* (Optional)

Seite (beginnend bei 0).


**Parameter:** *sys*  (Optional)
- C
- D
- CD

Systematik: C=Berufliche Qualifikation, D=Aufstiegsweiterbildung, CD=Systematiksuche.


**Parameter:** *sw*  (Optional)

Suchwort (z.B. Teilqualifikation)


**Parameter:** *ssw*  (Optional)

selektierteSternchenSuchworte (unvollständige Suchworte, z.B. Teilqualifi; pot. mehrere, durch Kommata getrennt).


Parameter: ids (Optional)

Berufs-ID einer Berufsbezeichnung (z.B. 6133 für Industriemeister/in - Lebensmittel). Mehrere Komma-getrennte Angaben möglich.


**Parameter:** *orte*  (Optional)

Ortsangabe nebst Koordinaten (longitude und latitude) jeweils durch Unterstriche getrennt (z.B. Erlangen_11.005_49.595)


**Parameter:** *uk* (Optional)
- Bundesweit
- ort
- 25
- 50
- 100
- 150
- 200

Umkreis:  Bundesweit=Bundesweit, ort=nur angegebener Ort, 25=25 km, 50=50 km, 100=100 km, 150=150 km, 200=200 km.


**Parameter:** *ortsunabhaengig* (Optional)
- true
- false

auch Orts-unabhängige Angebote einblenden (nur wirksam bei Setzung von Parameter ort).


**Parameter:** *re*  (Optional)
- BAW
- BAY
- BER
- BRA
- BRE
- HAM
- HES
- MBV
- NDS
- NRW
- RPF
- SAA
- SAC
- SAN
- SLH
- TH%C3%9C
- "-"
- iGB
- iP
- iCH
- iA
- iE


Region/Bundesland: BAW=Baden-Württemberg, BAY=Bayern, BER=Berlin, BRA=Brandenburg, BRE=Bremen, HAM=Hamburg, HES=Hessen, MBV=Mecklenburg-Vorpommern, NDS=Niedersachsen, NRW=Nordrhein-Westfalen, RPF=Rheinland-Pfalz, SAA=Saarland, SAC=Sachsen, SAN=Sachsen-Anhalt, SLH=Schleswig-Holstein, TH%C3%9C=Thüringen, -=überregional, iGB=Großbritannien, iP=Portugal, iCH=Schweiz, iA=Österreich, iE=Spanien. Mehrere Komma-getrennte Angaben möglich (z.B. re=TH%C3%9C,BAW).

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


**Parameter:** *ban* (Optional)
Anbieter-ID (z.B. 22210). 


**Parameter:** *it* (Optional)
- RC
- RD

Integrationstyp: RC=Ausbildung Reha, RD=weiterbildung Reha. Mehrere Komma-getrennte Angaben möglich (z.B. re=RC,RD).


**Parameter:** *bg* (Optional)
- true
- false

Bildungsgutschein: true=nur Angebote mit Zulassung zur Förderung mit Bildungsgutschein anzeigen, false=nicht nur Angebote mit Zulassung zur Förderung mit Bildungsgutschein anzeigen.

**Parameter:** *ortsunabhaengig* (Optional)
- true
- false

Ortsunabhängigkeit: true=Angebote anzeigen die ortsunabhängig sind, false=ortsunabhängige orte ausblenden.

**Parameter:** *sort* (Optional)
- std
- ta
- tz

Sortierung: std=Zufall,  ta=Angebotstitel A bis Z,  tz=Angebotstitel Z bis A

### Beispiel:

```bash
wb=$(curl -m 60 \
-H "X-API-Key: infosysbub-wbsuche" \
'https://rest.arbeitsagentur.de/infosysbub/wbsuche/pc/v2/bildungsangebot?orte=Erlangen_11.005_49.595&uk=Bundesweit&bg=false&page=0')
```
