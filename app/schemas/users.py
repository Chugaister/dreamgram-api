from pydantic import BaseModel

class UserBase(BaseModel):
    username: str

    class Config:
        from_attributes = True


class User(UserBase):
    pass


class SignupUser(UserBase):
    password: str
