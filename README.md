# 绿野追踪

🎨GitHub Contribution Visualizer

🤖AI-Powered Automation
This repository is an automated system, assisted by AI, designed to "paint" green contribution squares on the GitHub contribution graph. It is not a manual project but a fully automated CI/CD workflow.

🚀 Core Features
⏰ Scheduled Tasks
Leveraging GitHub Actions' cron scheduling, the system runs automatically every day at midnight Beijing Time (16:00 UTC).
🎲 Randomized Activity
The built-in Shell script determines the day's "activity level" by randomly executing between 1 to 5 code commits. This simulates the fluctuating workload of real-world development, creating a natural-looking pattern of深浅 (深浅 means light and dark shades) green squares on the contribution graph.

⚙️ Fully Automated Process
From pulling the code and executing commits to pushing to the remote repository, the entire process requires zero human intervention.

🛠️ Technical Stack
| Component | Technology |
| :--- | :--- |
| Scheduler | GitHub Actions (YAML) |
| Execution Script | Bash Shell (`green.sh`) |
| Core Logic | Dynamically creates and commits files using loops and random number generators |
