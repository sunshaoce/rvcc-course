#!/usr/bin/env bash
# 这个脚本的作用是方便地切换 rvcc 项目的 commit。
# 你可以考虑把这个脚本复制到 rvcc 项目目录下，然后
# 1. 运行 `./jump.sh p` 来跳到当前 commit 的前一节课程的 commit
# 2. 运行 `./jump.sh n` 来跳到当前 commit 的后一节课程的 commit
# 3. 运行 `./jump.sh <number>` 来跳到第 number 节课程的 commit
#    如   `./jump.sh 1` 是跳到第一节课程的 commit

case $1 in
    p)
        git checkout HEAD^
        ;;
    n)
        git checkout $(git rev-list --topo-order HEAD..main | tail -1)
        ;;
    *)
        git checkout $(git log --reverse --oneline main | head -$1 | tail -1 | awk '{ print $1 }')
        ;;
esac
