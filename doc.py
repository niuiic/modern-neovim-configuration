import os
import re
from http.client import HTTPSConnection
from concurrent.futures import ThreadPoolExecutor


def walk_dir(dir, cb):
    for f in os.listdir(dir):
        path = os.path.join(dir, f)
        if os.path.isdir(path):
            walk_dir(path, cb)
        else:
            cb(path)


plugins = set()


def collect_plugins(file):
    with open(file, "r") as f:
        for line in f:
            match = re.findall(r'"[^/"\s<>@]+/[^/"\s<>@]+"', line)
            if match:
                for plugin in match:
                    plugins.add(plugin[1:-1])
    return plugins


walk_dir("./lua", collect_plugins)

valid_plugins = []


def filter_valid_plugin(plugin):
    try:
        if plugin.startswith("plugin/"):
            return
        print(f"check {plugin}")
        conn = HTTPSConnection("github.com", timeout=30)
        conn.request("GET", f"/{plugin}")
        response = conn.getresponse()
        conn.close()
        if response.status >= 400:
            print(f"{plugin} is invalid")
            return
        valid_plugins.append(plugin)
    except:
        pass


with ThreadPoolExecutor(max_workers=20) as executor:
    [executor.submit(filter_valid_plugin, plugin) for plugin in plugins]

valid_plugins = sorted(valid_plugins)

doc = ""

with open("./README.md", "r") as f:
    for line in f.readlines():
        doc = doc + line
        if line.startswith("## Plugins"):
            doc = doc + "\n"
            break

for plugin in valid_plugins:
    doc += f"- [{plugin}](https://github.com/{plugin}) ![](https://img.shields.io/github/stars/{plugin}) ![](https://img.shields.io/github/last-commit/{plugin}) ![](https://img.shields.io/github/commit-activity/y/{plugin})\n"

with open("./README.md", "w") as f:
    f.write(doc)
    f.close()
