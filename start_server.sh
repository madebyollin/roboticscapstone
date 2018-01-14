#!/usr/bin/env bash
# Script for local testing of website
port=9000
# Open page in web browser (try macOS, then linux)
url="http://localhost:$port"
open "$url" || xdg-open "$url"
# Start a local webserver (try python 3, then 2)
python -m http.server $port || python -m SimpleHTTPServer $port
