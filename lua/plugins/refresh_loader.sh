#!/bin/zsh

# 定义输出文件名
OUTPUT_FILE="loader.lua"

# 获取当前目录下所有.lua后缀的文件名，并转换为require形式写入到指定的OUTPUT_FILE中（会覆盖原有内容）
{
    for file in *.lua; do
        if [[ $file != "$OUTPUT_FILE" ]]; then
            module=$(basename "$file" .lua)
            echo "require('plugins.$module')"
        fi
    done
} > "$OUTPUT_FILE"
