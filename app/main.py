from fastapi import FastAPI
from app.model import WordsVowelIn, WordsSortIn, OrderType


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
    return sorted(data.words, reverse=data.order is OrderType.DESC)
