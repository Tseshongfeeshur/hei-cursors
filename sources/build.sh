#!/bin/bash
set -euo pipefail

# 配置参数
SIZES=(24 32 48 64 96 128 192 256 512)
OUT_XCUR_DIR="./hei_cursors/cursors"
TMP_DIR="./build_tmp"
PNGS_ROOT="./pngs"  # 定义根目录变量

# 目录准备
rm -rf "$OUT_XCUR_DIR" "$TMP_DIR"
mkdir -p "$OUT_XCUR_DIR"
cp ./breeze-cursors/* "$OUT_XCUR_DIR"
mkdir -p "$TMP_DIR"

# 处理函数
process_cursor() {
    local category=$1
    local name=$2
    local src_path="$PNGS_ROOT/$category/$name"
    local conf_file="$src_path/${name}.conf"

    if [ ! -f "$conf_file" ]; then
        echo "[SKIP ] $name : File $conf_file not found"
        return
    fi

    echo ">>> Processing [$category] : $name"

    # 1. 读取有效帧
    mapfile -t frames < <(grep -v '^\s*#' "$conf_file" | sed '/^\s*$/d')
    if [ "${#frames[@]}" -eq 0 ]; then return; fi

    # 2. 获取原始基准尺寸
    local orig_size=$(echo "${frames[0]}" | awk '{print $1}')

    local tmp_conf="$TMP_DIR/${name}.conf"
    : > "$tmp_conf"

    # 3. 循环缩放
    for SZ in "${SIZES[@]}"; do
        local scale=$(awk -v s="$SZ" -v o="$orig_size" 'BEGIN{printf "%.8f", s/o}')

        local idx=0
        for ln in "${frames[@]}"; do
            local xhot=$(echo "$ln" | awk '{print $2}')
            local yhot=$(echo "$ln" | awk '{print $3}')
            local path=$(echo "$ln" | awk '{print $4}')
            local delay=$(echo "$ln" | awk '{print $5}')

            local xh=$(awk -v x="$xhot" -v sc="$scale" 'BEGIN{printf "%d", (x*sc)+0.5}')
            local yh=$(awk -v y="$yhot" -v sc="$scale" 'BEGIN{printf "%d", (y*sc)+0.5}')

            local out_png="${TMP_DIR}/${name}_${SZ}_${idx}.png"

            # 路径纠错逻辑
            local src_png="$path"
            if [ ! -f "$src_png" ]; then
                src_png="$src_path/$(basename "$path")"
            fi

            if [ -f "$src_png" ]; then
                magick "$src_png" -resize "${SZ}x${SZ}" "$out_png"
                echo "$SZ $xh $yh $out_png $delay" >> "$tmp_conf"
            else
                echo "[ERROR] PNG not found: $src_png"
            fi

            idx=$((idx+1))
        done
    done

    # 4. 生成最终文件
    xcursorgen "$tmp_conf" "$OUT_XCUR_DIR/$name"
    echo "Done: $OUT_XCUR_DIR/$name"
}

# 主程序

# 处理静态光标
if [ -d "$PNGS_ROOT/static" ]; then
    # 使用 find 避免通配符展开失败的问题
    for d in "$PNGS_ROOT/static"/*; do
        if [ -d "$d" ]; then
            process_cursor "static" "$(basename "$d")"
        fi
    done
fi

# 处理动态光标
if [ -d "$PNGS_ROOT/animated" ]; then
    for d in "$PNGS_ROOT/animated"/*; do
        if [ -d "$d" ]; then
            process_cursor "animated" "$(basename "$d")"
        fi
    done
fi

# 清理
rm -rf "$TMP_DIR"

# 放置链接
cp -d ./links/* ./hei_cursors/cursors

# 放置描述信息
cp ./metadata/index.theme ./hei_cursors/
