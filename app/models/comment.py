from sqlalchemy import Column, ForeignKey
from sqlalchemy import (
    Integer,
    Boolean,
    String,
    Enum as SAEnum
)

from core.database.base import Base
from core.database.mixins.timestamp import TimestampMixin


class Comment(Base, TimestampMixin):
    __tablename__ = 'comments'
    __keyfield__ = 'comment_id'

    comment_id = Column(Integer, primary_key=True, autoincrement=True)
    entry_id = Column(Integer, ForeignKey('dream_entries.entry_id'), nullable=False)
    user_id = Column(Integer, ForeignKey('users.user_id'), nullable=False)
    content = Column(String, nullable=False)


class Reaction(Base, TimestampMixin):
    __tablename__ = 'reactions'
    __keyfield__ = 'reaction_id'

    reaction_id = Column(Integer, primary_key=True, autoincrement=True)
    entry_id = Column(Integer, ForeignKey('dream_entries.entry_id'), nullable=False)
    user_id = Column(Integer, ForeignKey('users.user_id'), nullable=False)
    content = Column(String, nullable=False)
