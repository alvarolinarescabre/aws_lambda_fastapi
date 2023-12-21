import os
import re
import shutil
import uvicorn
import requests
from fastapi import FastAPI
from mangum import Mangum
from fastapi.encoders import jsonable_encoder
from fastapi.responses import JSONResponse
from timeit import default_timer as timer


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

dir_download = "/tmp/download/"
dir_counted = "/tmp/counted/"


def save_file(tmp_dir: str, filename: str, data: str, format: str) -> None:
    """
    Save the data to a file
    :param tmp_dir:
    :param filename:
    :param data:
    :param format:
    :return:
    """
    with open(f"{tmp_dir}/{filename}.txt", format) as file:
        file.write(data)
        print(f"Saved {filename}.txt")


def read_file(filename: str) -> str:
    """
    Read a file
    :param filename:
    :return: Content File
    """
    with open(filename, 'r') as file:
        content = file.read()
        return content


def create_dir(dir_name: str) -> None:
    """
    Create a directory
    :param dir_name:
    :return:
    """
    os.makedirs(dir_name, exist_ok=True)
    print(f"Created {dir_name}")


def delete_dir(dir_name: str) -> None:
    """
    Delete the directory
    :param temp_dir:
    :return:
    """
    shutil.rmtree(dir_name)
    print(f"Deleted {dir_name}")


def download_file(dir_name: str, url: str) -> str:
    """
    Download the file from URL
    :param url:
    :return:
    """
    response = requests.get(url)
    filename = url.split('/')
    filename = f"pre.{filename[len(filename) - 1]}"


    save_file(dir_name, filename, response.content, "wb")

    return f"{dir_name}{filename}.txt"


def search_tag(dir_name: str, filename: str, tag: str) -> str:
    """
    Search the specific tag from file
    :param filename:
    :param tag:
    :return: String with matching tags
    """
    count_word = 0

    for match in re.findall(tag, read_file(filename)):
        if match == tag:
            count_word += 1

    filename = filename.split('/')
    filename = f"post.{filename[len(filename) - 1].strip('.pre.').strip('.txt')}"
    data = f"The site: {filename.strip('.post.')} haves total of '{tag}' tags: {count_word}"
    save_file(dir_name, filename, data, "w")

    return data


api_stage = os.environ.get("API_STAGE", "")
app = FastAPI(root_path=f"/{api_stage}", docs_url="/docs")


@app.get("/")
async def index():
    return {"hello": "world"}


@app.get("/ping")
async def healthcheck():
    return {"success": "pong!"}


@app.get("/counter")
def counter_tags():
    output = {}
    start = timer()
    create_dir(dir_download)
    create_dir(dir_counted)

    for key, page in enumerate(random_website):
        output[key] = search_tag(dir_counted, download_file(dir_download, page), "href=")

    delete_dir(dir_download)
    delete_dir(dir_counted)

    end = timer()
    output[10] = f"The Execution Time take: {round(end - start, 2)} seconds"

    json_data = jsonable_encoder(output)

    return JSONResponse(content=json_data)


handler = Mangum(app)


if __name__ == "__main__":
    uvicorn_app = f"{os.path.basename(__file__).removesuffix('.py')}:app"
    uvicorn.run(uvicorn_app, host="0.0.0.0", port=5000, reload=True)
