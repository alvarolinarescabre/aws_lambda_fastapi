from timeit import default_timer as timer
from fastapi import FastAPI
from fastapi.encoders import jsonable_encoder
from fastapi.responses import JSONResponse
import uvicorn

from lib.helpers import download_file, delete_dir, search_tag, create_dir

random_website = [
    "https://www.lapatilla.com",
    "https://www.savanamed.com",
    "https://www.realpython.com",
    "https://www.facebook.com",
    "https://www.instagram.com",
    "https://www.youtube.com",
    "https://www.mozilla.org",
    "https://www.github.com",
    "https://www.elmundo.com",
    "https://www.python.org"
]

dir_download = "./temp_dir/download/"
dir_counted = "./temp_dir/counted/"

app = FastAPI()


@app.get("/")
async def index():
    output = {}
    start = timer()
    create_dir(dir_download)
    create_dir(dir_counted)

    for key, page in enumerate(random_website):
        output[key] = search_tag(dir_counted, download_file(dir_download, page), "href=")

    delete_dir("./temp_dir/")

    end = timer()
    output[10] = f"The Execution Time take: {round(end - start, 2)} seconds"

    json_data = jsonable_encoder(output)

    return JSONResponse(content=json_data)


@app.get("/health-check/")
async def health_check():
    return {"message": "OK"}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
