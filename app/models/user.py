from sqlalchemy import Column, ForeignKey
from sqlalchemy import (
    Integer,
    Boolean,
    String,
    Enum as SAEnum
)
from sqlalchemy.dialects.postgresql import JSON
from enum import Enum

from core.database.base import Base
from core.database.mixins.timestamp import TimestampMixin


class UserRole(str, Enum):
    ADMIN = "admin"
    USER = "user"


class User(Base, TimestampMixin):
    __tablename__ = 'users'
    __keyfield__ = "user_id"

    user_id = Column(Integer, primary_key=True, autoincrement=True)
    username = Column(String, unique=True, nullable=False)
    email = Column(String)
    password_hash = Column(String, nullable=False)
    bio = Column(String, default=None)
    privacy_default = Column(String, default=None)
    role = Column(SAEnum(UserRole, name="user_role"), nullable=False, default=UserRole.USER)


class Friendship(Base):
    __tablename__ = 'friendships'
    __keyfield__ = 'friendship_id'

    friendship_id = Column(Integer, primary_key=True, autoincrement=True)
    user1_id = Column(Integer, ForeignKey('users.user_id'), nullable=False)
    user2_id = Column(Integer, ForeignKey('users.user_id'), nullable=False)

    status = Column(String)


class UserPreferences(Base):
    __tablename__ = 'user_preferences'
    preference_id = Column(Integer, primary_key=True, autoincrement=True)
    notifications_enabled = Column(Boolean, nullable=False, default=False)
    ai_analysis_enabled = Column(Boolean, nullable=False, default=False)
    public_profile = Column(Boolean, nullable=False, default=False)
    theme_settings = Column(JSON, nullable=False, default={})
