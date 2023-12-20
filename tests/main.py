import pytest
from starlette.testclient import TestClient

from services.main import app


@pytest.fixture
def client():
    return TestClient(app)


def test_health_check(client):
    """
    Test that we can check the health of the app
    :param client:
    :return:
    """
    response = client.get("/health-check/")
    assert response.status_code == 200
    assert response.json() == {"message": "OK"}