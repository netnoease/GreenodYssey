#!/bin/bash

# 1. 必须配置 Git 用户信息 (双重保险，防止 YAML 环境配置丢失)
git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"

# 2. 随机决定今天提交几次 (1 到 5 次)
TIMES=$((RANDOM % 5 + 1))

echo "🎨 今天心情不错，准备提交 $TIMES 次来刷绿！"

# 3. 获取当前分支名称 (自动适应 main 或 master)
# 这样可以防止因为分支名不对导致推送失败
CURRENT_BRANCH=$(git branch --show-current)

# 4. 循环提交
for i in $(seq 1 $TIMES)
do
  # 创建文件夹
  mkdir -p .green
  
  # 生成随机内容
  # 使用时间戳和随机数确保每次内容都不一样
  echo "Making the wall green at $(date) - Attempt $i - Random: $RANDOM" >> .green/paint.log
  
  # Git 操作
  git add .green/paint.log
  
  # 提交
  git commit -m "chore: auto painting green $i/$TIMES [skip ci]"
  
  # 推送 (使用动态获取的分支名)
  if git push origin $CURRENT_BRANCH; then
    echo "✅ 第 $i 次提交成功"
  else
    echo "❌ 第 $i 次提交失败，可能是网络问题或冲突"
    # 即使失败也继续下一次，或者你可以选择 exit 1 终止
  fi
  
  # 稍微休眠一下，防止 GitHub 限流或处理过快导致合并冲突
  sleep 1
done

echo "✅ 刷绿任务全部完成！"
