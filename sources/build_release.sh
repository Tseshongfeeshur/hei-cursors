#!/bin/bash
set -euo pipefail

./build.sh
tar -zcvf hei-cursors.tar.gz hei_cursors
rm -R hei_cursors
