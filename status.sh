#!/bin/bash
# Prints remaining Pingu family to-do items in saved order
curl -s "https://api.restful-api.dev/objects/ff808181a09d98f701a129ee30e13afc" | python3 -c 'import sys,json;d=json.load(sys.stdin)["data"];it={i["id"]:i for i in d["items"]};o=[x for x in d.get("order",[]) if x in it]+[i["id"] for i in d["items"] if i["id"] not in d.get("order",[])];r=[it[x]["text"] for x in o if not it[x]["done"]];n=len(it);print(n-len(r),"of",n,"done");[print("- "+t) for t in r]'
