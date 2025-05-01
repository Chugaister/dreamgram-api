from sqlalchemy import Column, ForeignKey
from sqlalchemy import (
    Integer,
    Boolean,
    String
)
from sqlalchemy.dialects.postgresql import JSON, SMALLINT
from core.database.base import Base
from core.database.mixins.timestamp import TimestampMixin


class DreamEntry(Base, TimestampMixin):
    __tablename__ = 'dream_entries'
    __keyfield__ = "entry_id"

    entry_id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey('users.user_id'))
    title = Column(String(255))
    content = Column(String)
    privacy_setting = Column(JSON, nullable=False)
    emotion_score = Column(SMALLINT, nullable=False)
    is_lucid = Column(Boolean, nullable=False, default=False)


class DreamTag(Base):
    __tablename__ = 'dream_tags'
    __keyfield__ = "tag_id"

    tag_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(255))
    description = Column(String(255))


class EntryTag(Base):
    __tablename__ = 'entry_tags'

    entry_tag_id = Column(Integer, primary_key=True, autoincrement=True)
    entry_id = Column(Integer, ForeignKey('dream_entries.entry_id'))
    tag_id = Column(Integer, ForeignKey('dream_tags.tag_id'))

