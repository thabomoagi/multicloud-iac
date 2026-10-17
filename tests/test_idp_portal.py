import sys
import os
from fastapi.testclient import TestClient

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../idp-portal")))
from app.main import app

client = TestClient(app)

def test_health_endpoint():
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json() == {"status": "healthy"}

def test_get_catalog():
    response = client.get("/catalog")
    assert response.status_code == 200
    catalog = response.json()
    assert isinstance(catalog, list)
    assert len(catalog) >= 2

def test_provision_valid_blueprint():
    payload = {
        "blueprint_id": "aws-vpc-secure",
        "environment": "dev",
        "owner": "platform-team"
    }
    response = client.post("/provision", json=payload)
    assert response.status_code == 200
    data = response.json()
    assert data["status"] == "provisioning_queued"
    assert data["blueprint_id"] == "aws-vpc-secure"

def test_provision_invalid_blueprint():
    payload = {
        "blueprint_id": "invalid-blueprint",
        "environment": "dev",
        "owner": "platform-team"
    }
    response = client.post("/provision", json=payload)
    assert response.status_code == 400
