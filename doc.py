import sys
import os
import re
import json
from http.client import HTTPSConnection
from concurrent.futures import ThreadPoolExecutor

if len(sys.argv) < 2:
    print("Usage: python doc.py <GITHUB_TOKEN>")
    sys.exit(1)


plugins = {}


def collect_plugins(file):
    with open(file, "r") as f:
        for line in f:
            match = re.findall(r'"[^/"\s<>@]+/[^/"\s<>@]+"', line)
            if match:
                for plugin in match:
                    if not plugin[1:-1].startswith("plugin"):
                        plugins[plugin[1:-1]] = ""


def walk_dir(dir, cb):
    for f in os.listdir(dir):
        path = os.path.join(dir, f)
        if os.path.isdir(path):
            walk_dir(path, cb)
        else:
            cb(path)


walk_dir("./lua", collect_plugins)


def validate_plugin(plugin):
    print(f"check {plugin}")
    conn = HTTPSConnection("api.github.com", timeout=10)
    conn.request(
        "GET",
        f"/repos/{plugin}",
        headers={
            "Accept": "application/vnd.github+json",
            "Authorization": f"Bearer {sys.argv[1]}",
            "X-GitHub-Api-Version": "2022-11-28",
            "User-Agent": "App/1.0",
        },
    )
    response = conn.getresponse()
    if response.status >= 400:
        del plugins[plugin]
    else:
        plugins[plugin] = json.loads(response.read().decode("utf-8"))["description"]
    conn.close()


with ThreadPoolExecutor(max_workers=20) as executor:
    [executor.submit(validate_plugin, plugin) for plugin in plugins]


lines = []
for plugin in plugins:
    lines.append(
        f"- [{plugin}](https://github.com/{plugin}) - {plugins[plugin]}\n\n![](https://img.shields.io/github/stars/{plugin}) ![](https://img.shields.io/github/last-commit/{plugin}) ![](https://img.shields.io/github/commit-activity/y/{plugin})"
    )


doc = ""
with open("./README.md", "r") as f:
    for line in f.readlines():
        doc += line
        if line.startswith("## Plugins"):
            doc += "\n"
            break
lines = sorted(lines)
for line in lines:
    doc += line + "\n"

with open("./README.md", "w") as f:
    f.write(doc)
    f.close()
