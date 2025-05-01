from sqlalchemy import Column, ForeignKey
from sqlalchemy import (
    Integer,
    String
)
from core.database.base import Base
from core.database.mixins.timestamp import TimestampMixin


class Image(Base, TimestampMixin):
    __tablename__ = 'images'
    __keyfield__ = "image_id"

    image_id = Column(Integer, primary_key=True, autoincrement=True)
    entry_id = Column(Integer, ForeignKey('dream_entries.entry_id'), nullable=False)
    image_url = Column(String, nullable=False)
    prompt_used = Column(String, nullable=False)
