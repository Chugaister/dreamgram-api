from fastapi import APIRouter

from api.system import system_router
from api.auth import auth_router


router = APIRouter()
router.include_router(system_router, prefix="/system")
router.include_router(auth_router, prefix="/auth")
