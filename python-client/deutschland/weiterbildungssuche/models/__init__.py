# flake8: noqa

# import all models into this package
# if you have many models here with many references from one model to another this may
# raise a RecursionError
# to avoid this, import only the models that you directly need like:
# from from deutschland.weiterbildungssuche.model.pet import Pet
# or import this package, but before doing it, use:
# import sys
# sys.setrecursionlimit(n)

from deutschland.weiterbildungssuche.model.response import Response
from deutschland.weiterbildungssuche.model.response_aggregations import (
    ResponseAggregations,
)
from deutschland.weiterbildungssuche.model.response_aggregations_anzahlausgefiltert import (
    ResponseAggregationsANZAHLAUSGEFILTERT,
)
from deutschland.weiterbildungssuche.model.response_aggregations_anzahlgesamt import (
    ResponseAggregationsANZAHLGESAMT,
)
from deutschland.weiterbildungssuche.model.response_aggregations_lernformen import (
    ResponseAggregationsLERNFORMEN,
)
from deutschland.weiterbildungssuche.model.response_aggregations_regionen import (
    ResponseAggregationsREGIONEN,
)
from deutschland.weiterbildungssuche.model.response_aggregations_unterrichstzeit import (
    ResponseAggregationsUNTERRICHSTZEIT,
)
from deutschland.weiterbildungssuche.model.response_embedded import ResponseEmbedded
from deutschland.weiterbildungssuche.model.response_embedded_adresse import (
    ResponseEmbeddedAdresse,
)
from deutschland.weiterbildungssuche.model.response_embedded_adresse_koordinaten import (
    ResponseEmbeddedAdresseKoordinaten,
)
from deutschland.weiterbildungssuche.model.response_embedded_adresse_ort_stra_e import (
    ResponseEmbeddedAdresseOrtStraE,
)
from deutschland.weiterbildungssuche.model.response_embedded_adresse_ort_stra_e_land import (
    ResponseEmbeddedAdresseOrtStraELand,
)
from deutschland.weiterbildungssuche.model.response_embedded_angebot import (
    ResponseEmbeddedAngebot,
)
from deutschland.weiterbildungssuche.model.response_embedded_ansprechpartner import (
    ResponseEmbeddedAnsprechpartner,
)
from deutschland.weiterbildungssuche.model.response_embedded_dauer import (
    ResponseEmbeddedDauer,
)
from deutschland.weiterbildungssuche.model.response_embedded_rollen import (
    ResponseEmbeddedRollen,
)
from deutschland.weiterbildungssuche.model.response_embedded_termine import (
    ResponseEmbeddedTermine,
)
from deutschland.weiterbildungssuche.model.response_embedded_unterrichtsform import (
    ResponseEmbeddedUnterrichtsform,
)
from deutschland.weiterbildungssuche.model.response_embedded_unterrichtszeit import (
    ResponseEmbeddedUnterrichtszeit,
)
from deutschland.weiterbildungssuche.model.response_links import ResponseLinks
from deutschland.weiterbildungssuche.model.response_links_first import (
    ResponseLinksFirst,
)
from deutschland.weiterbildungssuche.model.response_links_last import ResponseLinksLast
from deutschland.weiterbildungssuche.model.response_links_next import ResponseLinksNext
from deutschland.weiterbildungssuche.model.response_page import ResponsePage
