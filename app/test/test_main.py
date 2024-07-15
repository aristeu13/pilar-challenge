from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)


def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"Hello": "World"}


def test_vowel_count():
    response = client.post("/vowel_count", json={"words": ["hello", "world"]})
    assert response.status_code == 200
    assert response.json() == {"hello": 2, "world": 1}


def test_sort_asc():
    response = client.post(
        "/sort", json={"words": ["banana", "apple", "cherry"], "order": "asc"}
    )
    assert response.status_code == 200
    assert response.json() == ["apple", "banana", "cherry"]


def test_sort_desc():
    response = client.post(
        "/sort", json={"words": ["banana", "apple", "cherry"], "order": "desc"}
    )
    assert response.status_code == 200
    assert response.json() == ["cherry", "banana", "apple"]
