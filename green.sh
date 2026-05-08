#!/bin/bash

# 这个脚本的作用是：在当前日期，随机生成 1 到 5 次提交
# 这样能让你的贡献图变成随机深浅的绿色

# 1. 随机决定今天提交几次 (1 到 5 次)
# 1次=浅绿, 5次=深绿
TIMES=$((RANDOM % 5 + 1))

echo "🎨 今天心情不错，准备提交 $TIMES 次来刷绿！"

# 2. 循环提交
for i in $(seq 1 $TIMES)
do
  # 创建一个随机内容的文件，或者修改现有文件
  # 这里我们创建一个 .green 文件夹来存放这些“涂鸦”
  mkdir -p .green
  
  # 生成一个随机字符串写入文件
  echo "Making the wall green at $(date) - Attempt $i - Random: $RANDOM" >> .green/paint.log
  
  # 3. 执行 Git 操作
  git add .green/paint.log
  
  # 注意：这里不需要指定时间，因为 GitHub Actions 运行时默认就是当前时间
  # 如果你想控制过去的日期，才需要修改环境变量
  git commit -m "chore: auto painting green $i/$TIMES [skip ci]"
  
  # 推送到远程
  git push origin main
done

echo "✅ 刷绿完成！"
