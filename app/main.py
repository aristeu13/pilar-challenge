from app.model import WordsVowelIn, WordsSortIn, OrderType
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.post("/vowel_count")
def route_vowel_count(data: WordsVowelIn):
    hash_map = {}
    for word in data.words:
        hash_map[word] = 0
        for char in word.lower():
            if char in "aeiou":
                hash_map[word] += 1

    return hash_map


@app.post("/sort")
def route_sort_words(data: WordsSortIn):
    words = [word for word in data.words]

    return sorted(words, reverse=True if data.order is OrderType.DESC else False)
