# weiterbildungssuche.DefaultApi

All URIs are relative to *https://rest.arbeitsagentur.de/infosysbub/wbsuche*

Method | HTTP request | Description
------------- | ------------- | -------------
[**weiterbildungssuche**](DefaultApi.md#weiterbildungssuche) | **GET** /pc/v1/bildungsangebot | Weiterbildungssuche


# **weiterbildungssuche**
> Response weiterbildungssuche()

Weiterbildungssuche

Die Weiterbildungssuche ermöglicht verfügbare Weiterbildungsangebote mit verschiedenen GET-Parametern zu filtern.

### Example

* OAuth Authentication (clientCredAuth):

```python
import time
from deutschland import weiterbildungssuche
from deutschland.weiterbildungssuche.api import default_api
from deutschland.weiterbildungssuche.model.response import Response
from pprint import pprint
# Defining the host is optional and defaults to https://rest.arbeitsagentur.de/infosysbub/wbsuche
# See configuration.py for a list of all supported configuration parameters.
configuration = weiterbildungssuche.Configuration(
    host = "https://rest.arbeitsagentur.de/infosysbub/wbsuche"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure OAuth2 access token for authorization: clientCredAuth
configuration = weiterbildungssuche.Configuration(
    host = "https://rest.arbeitsagentur.de/infosysbub/wbsuche"
)
configuration.access_token = 'YOUR_ACCESS_TOKEN'

# Enter a context with an instance of the API client
with weiterbildungssuche.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = default_api.DefaultApi(api_client)
    sys = "C" # str | Systematik - C=Berufliche Qualifikation, D=Aufstiegsweiterbildung, CD=Systematiksuche. (optional)
    sw = "IT-Security%2520-%2520allgemein" # str | Suchwort (optional)
    ort = "Feucht_90537_11.224918_49.376701" # str | Ortsangabe nebst Postleitzahl und Koordinaten (optional)
    page = 1 # int | Ergebnissseite (optional)
    size = 50 # int | Anzahl von Ergebnissen (optional)
    uk = "Bundesweit" # str | Umkreis - Bundesweit=Bundesweit, 25=25 km, 50=50 km, 100=100 km, 150=150 km, 200=200 km. (optional)
    re = "BW" # str | Region/Bundesland - BW=Baden-Württemberg, BY=Bayern, BE=Berlin, BB=Brandenburg, HB=Bremen, HH=Hamburg, HE=Hessen, MV=Mecklenburg-Vorpommern, NI=Niedersachsen, NW=Nordrhei-Westfalen, RP=Rheinland-Pfalz, SL=Saarland, SN=Sachsen, ST=Sachsen-Anhalt, SH=Schleswig-Holstein, TH=Thüringen. Mehrere Komma-getrennte Angaben möglich. (optional)
    bt = 0 # int | Beginntermin - 0=regelmäßiger Start, 1=diesen Monat, 2=Folgemonat, 3=in zwei Monaten, 4=in drei Monaten, 5=in mehr als drei Monaten (optional)
    uz = 1 # int | Unterrichtszeit - 1=Vollzeit, 2=Teilzeit. Mehrere Komma-getrennte Angaben möglich. (optional)
    dauer = 0 # int | Dauer - 0=Auf Anfrage, 1,2=bis eine Woche, 1,2,3=bis ein Monat, 1,2,3,4=bis drei Monate, 1,2,3,4,5=bis sechs Monate, 1,2,3,4,5,6=bis ein Jahr, 7,8,9=mehr als ein Jahr. Mehrere Komma-getrennte Angaben sind die Regel. (optional)
    uf = 101 # int | Unterrichtsform. 101=Präsenzveranstaltung, 102=Seminar, 103=Workshop, 104=Praxistraining, 105=Sonstige Präsenzveranstaltung, 201=Virtuelles Klassenzimmer, 202=Online-Seminar, 203=Online-Coaching, 204=Selbstlernmodul, 206=Sonstige digitale Lernformen, 301=Blended Learning, 302=Combined Learning, 303=Hybrid Learning, 304=Sonstige kombinierte Lernformen,401=Fernunterricht, 402=Fernlehrgang, 403=Sonstiger Fernunterricht. Mehrere Komma-getrennte Angaben möglich (z.B. uf=101,202). (optional)
    anbieter = 22210 # int | Anbieter-ID (optional)
    it = "RC" # str | Integrationstyp - RC=Ausbildung Reha, RD=weiterbildung Reha. Mehrere Komma-getrennte Angaben möglich. (optional)
    bg = True # bool | Bildungsgutschein - true=nur Angebote mit Zulassung zur Förderung mit Bildungsgutschein anzeigen, false=nicht nur Angebote mit Zulassung zur Förderung mit Bildungsgutschein anzeigen. (optional)

    # example passing only required values which don't have defaults set
    # and optional values
    try:
        # Weiterbildungssuche
        api_response = api_instance.weiterbildungssuche(sys=sys, sw=sw, ort=ort, page=page, size=size, uk=uk, re=re, bt=bt, uz=uz, dauer=dauer, uf=uf, anbieter=anbieter, it=it, bg=bg)
        pprint(api_response)
    except weiterbildungssuche.ApiException as e:
        print("Exception when calling DefaultApi->weiterbildungssuche: %s\n" % e)
```


### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sys** | **str**| Systematik - C&#x3D;Berufliche Qualifikation, D&#x3D;Aufstiegsweiterbildung, CD&#x3D;Systematiksuche. | [optional]
 **sw** | **str**| Suchwort | [optional]
 **ort** | **str**| Ortsangabe nebst Postleitzahl und Koordinaten | [optional]
 **page** | **int**| Ergebnissseite | [optional]
 **size** | **int**| Anzahl von Ergebnissen | [optional]
 **uk** | **str**| Umkreis - Bundesweit&#x3D;Bundesweit, 25&#x3D;25 km, 50&#x3D;50 km, 100&#x3D;100 km, 150&#x3D;150 km, 200&#x3D;200 km. | [optional]
 **re** | **str**| Region/Bundesland - BW&#x3D;Baden-Württemberg, BY&#x3D;Bayern, BE&#x3D;Berlin, BB&#x3D;Brandenburg, HB&#x3D;Bremen, HH&#x3D;Hamburg, HE&#x3D;Hessen, MV&#x3D;Mecklenburg-Vorpommern, NI&#x3D;Niedersachsen, NW&#x3D;Nordrhei-Westfalen, RP&#x3D;Rheinland-Pfalz, SL&#x3D;Saarland, SN&#x3D;Sachsen, ST&#x3D;Sachsen-Anhalt, SH&#x3D;Schleswig-Holstein, TH&#x3D;Thüringen. Mehrere Komma-getrennte Angaben möglich. | [optional]
 **bt** | **int**| Beginntermin - 0&#x3D;regelmäßiger Start, 1&#x3D;diesen Monat, 2&#x3D;Folgemonat, 3&#x3D;in zwei Monaten, 4&#x3D;in drei Monaten, 5&#x3D;in mehr als drei Monaten | [optional]
 **uz** | **int**| Unterrichtszeit - 1&#x3D;Vollzeit, 2&#x3D;Teilzeit. Mehrere Komma-getrennte Angaben möglich. | [optional]
 **dauer** | **int**| Dauer - 0&#x3D;Auf Anfrage, 1,2&#x3D;bis eine Woche, 1,2,3&#x3D;bis ein Monat, 1,2,3,4&#x3D;bis drei Monate, 1,2,3,4,5&#x3D;bis sechs Monate, 1,2,3,4,5,6&#x3D;bis ein Jahr, 7,8,9&#x3D;mehr als ein Jahr. Mehrere Komma-getrennte Angaben sind die Regel. | [optional]
 **uf** | **int**| Unterrichtsform. 101&#x3D;Präsenzveranstaltung, 102&#x3D;Seminar, 103&#x3D;Workshop, 104&#x3D;Praxistraining, 105&#x3D;Sonstige Präsenzveranstaltung, 201&#x3D;Virtuelles Klassenzimmer, 202&#x3D;Online-Seminar, 203&#x3D;Online-Coaching, 204&#x3D;Selbstlernmodul, 206&#x3D;Sonstige digitale Lernformen, 301&#x3D;Blended Learning, 302&#x3D;Combined Learning, 303&#x3D;Hybrid Learning, 304&#x3D;Sonstige kombinierte Lernformen,401&#x3D;Fernunterricht, 402&#x3D;Fernlehrgang, 403&#x3D;Sonstiger Fernunterricht. Mehrere Komma-getrennte Angaben möglich (z.B. uf&#x3D;101,202). | [optional]
 **anbieter** | **int**| Anbieter-ID | [optional]
 **it** | **str**| Integrationstyp - RC&#x3D;Ausbildung Reha, RD&#x3D;weiterbildung Reha. Mehrere Komma-getrennte Angaben möglich. | [optional]
 **bg** | **bool**| Bildungsgutschein - true&#x3D;nur Angebote mit Zulassung zur Förderung mit Bildungsgutschein anzeigen, false&#x3D;nicht nur Angebote mit Zulassung zur Förderung mit Bildungsgutschein anzeigen. | [optional]

### Return type

[**Response**](Response.md)

### Authorization

[clientCredAuth](../README.md#clientCredAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | OK |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

