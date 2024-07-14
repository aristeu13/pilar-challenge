from enum import Enum
from pydantic import BaseModel


class WordsBaseIn(BaseModel):
    words: list[str]


class WordsVowelIn(WordsBaseIn):
    pass


class OrderType(Enum):
    ASC: str = "asc"
    DESC: str = "desc"


class WordsSortIn(WordsBaseIn):
    order: OrderType
