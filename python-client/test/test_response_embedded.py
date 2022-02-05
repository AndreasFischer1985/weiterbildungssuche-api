"""
    Bundesagentur für Arbeit: Weiterbildungssuche API

    Eine der größten Weiterbildungsdatenbanken Deutschlands durchsuchen.   Die Authentifizierung funktioniert per OAuth 2 Client Credentials mit JWTs. Folgende Client-Credentials können dafür verwendet werden:  **ClientID:** 38053956-6618-4953-b670-b4ae7a2360b1  **ClientSecret:** c385073c-3b97-42a9-b916-08fd8a5d1795.   **Achtung**: der generierte Token muss bei folgenden GET-requests im header als 'OAuthAccessToken' inkludiert werden.   # noqa: E501

    The version of the OpenAPI document: 1.0.0
    Contact: andreasfischer1985@web.de
    Generated by: https://openapi-generator.tech
"""


import sys
import unittest

from deutschland.weiterbildungssuche.model.response_embedded_termine import (
    ResponseEmbeddedTermine,
)

from deutschland import weiterbildungssuche

globals()["ResponseEmbeddedTermine"] = ResponseEmbeddedTermine
from deutschland.weiterbildungssuche.model.response_embedded import ResponseEmbedded


class TestResponseEmbedded(unittest.TestCase):
    """ResponseEmbedded unit test stubs"""

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def testResponseEmbedded(self):
        """Test ResponseEmbedded"""
        # FIXME: construct object with mandatory attributes with example values
        # model = ResponseEmbedded()  # noqa: E501
        pass


if __name__ == "__main__":
    unittest.main()
