import json
import os
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI(title="Multicloud IDP Marketplace API", version="1.0.0")

class ProvisionRequest(BaseModel):
    blueprint_id: str
    environment: str
    owner: str

@app.get("/health")
def health_check():
    return {"status": "healthy"}

@app.get("/catalog")
def get_catalog():
    catalog_path = os.path.join(os.path.dirname(__file__), "catalog.json")
    if not os.path.exists(catalog_path):
        raise HTTPException(status_code=404, catalog_path="Catalog not found")
    with open(catalog_path, "r") as f:
        data = json.load(f)
    return data

@app.post("/provision")
def provision_blueprint(request: ProvisionRequest):
    catalog_path = os.path.join(os.path.dirname(__file__), "catalog.json")
    with open(catalog_path, "r") as f:
        catalog = json.load(f)
    
    blueprint_ids = [item["id"] for item in catalog]
    if request.blueprint_id not in blueprint_ids:
        raise HTTPException(status_code=400, detail="Invalid blueprint ID")
    
    return {
        "status": "provisioning_queued",
        "blueprint_id": request.blueprint_id,
        "environment": request.environment,
        "owner": request.owner
    }
