from sqlalchemy import Column, ForeignKey
from sqlalchemy import (
    Integer,
    Boolean,
    String,
    Enum as SAEnum
)
from sqlalchemy.dialects.postgresql import JSON, SMALLINT
from enum import Enum

from core.database.base import Base
from core.database.mixins.timestamp import TimestampMixin


class AIAnalysis(Base, TimestampMixin):
    __tablename__ = 'ai_analysis'
    __keyfield__ = "analysis_id"

    analysis_id = Column(Integer, primary_key=True, autoincrement=True)
    entry_id = Column(Integer, ForeignKey('dream_entries.entry_id'), nullable=False)
    emotion_data = Column(JSON, nullable=False)
    symbols_detected = Column(JSON, nullable=False)
    interpretation = Column(String, nullable=False)
