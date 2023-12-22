import os
import uvicorn
from fastapi import FastAPI
from mangum import Mangum
from conf.settings import Settings
from routers import main

settings = Settings()
app = FastAPI(root_path=f"/{settings.api_stage}", docs_url="/docs")
app.include_router(main.router)
handler = Mangum(app)

if __name__ == "__main__":
    uvicorn_app = f"{os.path.basename(__file__).removesuffix('.py')}:app"
    uvicorn.run(uvicorn_app, host="0.0.0.0", port=5000, reload=True)
