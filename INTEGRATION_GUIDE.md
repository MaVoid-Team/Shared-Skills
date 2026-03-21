# 🔗 Integration Guide - Setup Skills in Your Project

This guide walks your team through step-by-step integration of these agent skills into your actual development and deployment workflow.

---

## 📋 Table of Contents

1. [Quick Integration (15 minutes)](#quick-integration)
2. [Full Team Integration (1 hour)](#full-team-integration)
3. [Project-Specific Setup](#project-specific-setup)
4. [Agent Usage in Workflow](#agent-usage-in-workflow)
5. [Team Contribution Workflow](#team-contribution-workflow)
6. [Troubleshooting](#troubleshooting)

---

## Quick Integration

**Use this if you want to start immediately with minimal setup.**

### Step 1: Get the Skills Repository
```bash
# Clone into your project directory (or as a shared resource)
cd ~/your-team-workspace
git clone <skills-repo-url> default-agent-skills

# Navigate
cd default-agent-skills
ls -la
# Should see: README.md, SETUP.md, QUICK_REFERENCE.md, skills/
```

### Step 2: One Team Member Reads Documentation
```bash
# Team lead reads:
1. README.md (5 min)
2. QUICK_REFERENCE.md (5 min)
3. SETUP.md (5 min)

# Team lead decides: Which skill do we need?
```

### Step 3: Share Relevant Skill Link
```bash
# Team lead sends to team:
"We need deployment help. Read here:
 skills/deployment-skill/TEAM_GUIDE.md"

# All team members read (15 min)
```

### Step 4: Start Using with Agent
```bash
# In your project, ask the agent:
"I need to deploy my [framework] app with Docker to our VPS.
 Can you help me set it up?"

# Agent activates skill automatically
# You get Docker files, Nginx config, deployment guide
```

### ✅ Done! Your team can now use the skills.

---

## Full Team Integration

**Use this for comprehensive team setup with best practices.**

### Phase 1: Repository Setup (10 minutes)

#### Step 1.1: Initialize in Your Organization
```bash
# Option A: Add as git submodule
cd your-main-project
git submodule add <skills-repo-url> .skills
git commit -m "Add shared agent skills as submodule"

# Option B: Fork and maintain your own version
# Go to GitHub → Fork the repo → Clone your fork
cd ~/team-resources
git clone <your-fork-url> agent-skills
```

#### Step 1.2: Create Team Documentation
```bash
# In your main project/team repo, create:
mkdir docs/team-resources
cp .skills/SETUP.md docs/team-resources/SKILLS_SETUP.md
cp .skills/QUICK_REFERENCE.md docs/team-resources/
cp .skills/README.md docs/team-resources/SKILLS_OVERVIEW.md

git add docs/team-resources/
git commit -m "Add agent skills documentation"
```

#### Step 1.3: Team Checklist
```bash
# Create a file: docs/ONBOARDING.md

## Agent Skills Onboarding
- [ ] Read SKILLS_OVERVIEW.md (README.md)
- [ ] Read SKILLS_SETUP.md (SETUP.md)
- [ ] Bookmark QUICK_REFERENCE.md
- [ ] Clone/access .skills/ folder
- [ ] Ask agent about your first task
```

### Phase 2: Team Onboarding (20 minutes)

#### Step 2.1: Team Meeting
```
Duration: 15-20 minutes
Participants: Team members
Facilitator: Tech lead

Agenda:
1. Explain what skills are (5 min)
   → Show: README.md slides
   
2. Demo one skill in action (10 min)
   → Show: "Ask agent about deployment"
   → Show: Automatic skill activation
   → Show: Generated files
   
3. Point to resources (5 min)
   → "Here's where to find help"
   → "Here's where to contribute"
```

#### Step 2.2: Create Team Slack Channel (optional)
```
Channel: #agent-skills-help
Purpose: Questions about using skills, sharing tips

Pin messages:
✅ QUICK_REFERENCE.md
✅ SKILLS_SETUP.md
✅ Link to examples folder
✅ Common use cases
```

#### Step 2.3: Verify Setup
```bash
# Each team member does this:
1. Clone/access skills repository
2. Read QUICK_REFERENCE.md
3. Ask agent one question about their work
4. Confirm agent response was helpful

# Quick verification:
"Ask agent how to deploy your current project type"
```

### Phase 3: Project Integration (30 minutes)

#### Step 3.1: Analyze Your Project
```bash
# Create file: PROJECT_TECH_STACK.md

# Our Tech Stack

## Backend
- Framework: [Node.js/Python/Go/etc]
- Version: [version]
- Key libraries: [list]

## Database
- Type: [PostgreSQL/MySQL/MongoDB/etc]
- Version: [version]

## Frontend (if applicable)
- Framework: [React/Vue/etc]
- Build tool: [webpack/vite/etc]

## Current Deployment
- Where: [VPS/AWS/Docker/etc]
- How: [manual/CI-CD/docker/etc]

## Related Skills
- Deployment: YES (need to setup Docker)
- Planning: NO (we use Jira)
- Error Handling: YES (need patterns)
```

#### Step 3.2: Map Skills to Your Project
```bash
# Create file: SKILLS_MAPPING.md

| Need | Skill | Location | Team Lead |
|------|-------|----------|-----------|
| Docker setup | Deployment | skills/deployment-skill/ | @john |
| Error handling patterns | Error Handling | skills/error-handling-patterns/ | @jane |
| Release planning | Planning | skills/planning/ | @bob |
| Brand voice | Brand Identity | skills/brand-identity/ | @sarah |
```

#### Step 3.3: Create Project-Specific Examples
```bash
# Add your own deployment to team reference
mkdir skills/deployment-skill/examples/your-company-app

# Copy your actual deployment files:
cp Dockerfile skills/deployment-skill/examples/your-company-app/
cp docker-compose.yml skills/deployment-skill/examples/your-company-app/
cp nginx.conf skills/deployment-skill/examples/your-company-app/nginx.conf.example
cp .env.example skills/deployment-skill/examples/your-company-app/

# Sanitize sensitive data!
sed -i 's/real_password/YOUR_PASSWORD_HERE/g' .env.example
sed -i 's/real.com/your-domain.com/g' nginx.conf.example

# Create README
cat > skills/deployment-skill/examples/your-company-app/README.md << 'EOF'
# Your Company App Deployment

Tech Stack:
- Framework: [Your framework]
- Database: [Your database]
- Status: Production-tested in our VPS

## Quick Deploy
[Your deployment steps]
EOF

# Commit
git add skills/deployment-skill/examples/your-company-app/
git commit -m "Add your-company-app deployment example"
```

### Phase 4: Workflow Integration (Part of daily work)

#### Step 4.1: Update Team Development Guide
```bash
# File: docs/DEVELOPMENT.md

## Deployment

When you need to setup deployment:

1. **Ask the agent**: "Setup Docker for my [framework] app"
2. **Agent uses**: Deployment skill automatically
3. **Reference**: Your company example in `.skills/examples/your-company-app/`
4. **Customize**: Adapt the generated files for your project
5. **Review**: Bring to code review for approval

## Error Handling

When designing error strategies:

1. **Ask agent**: "Help me design error handling for [scenario]"
2. **Agent uses**: Error handling patterns skill
3. **Discuss**: In code review
4. **Document**: In your code comments
```

#### Step 4.2: Create Team Decision Log
```bash
# File: docs/SKILLS_DECISIONS.md

## Skill Implementation Decisions

### Deployment (March 6, 2026)
**Decision:** Use Docker + Nginx for all projects
**Reason:** Consistency, scalability, security
**Implemented by:** @john
**Example:** your-company-app deployment
**Status:** ✅ In production

### Error Handling (TBD)
**Decision:** TBD
**Reason:** TBD
**Implemented by:** TBD
```

---

## Project-Specific Setup

Choose your project type below:

### 🟢 Setup for: Node.js + Express/Next.js

```bash
# Step 1: Analyze your project
ls -la
# You should see: package.json, src/, Dockerfile (maybe)

# Step 2: Ask the agent
"I have a Next.js project with PostgreSQL. 
 Create Docker and Nginx setup for production deployment."

# Step 3: Agent provides:
✓ Dockerfile
✓ docker-compose.yml
✓ nginx.conf.example
✓ .env.example
✓ setup-docker.sh
✓ DOCKER_DEPLOYMENT.md

# Step 4: Reference your company example
cat .skills/examples/your-company-app/docker-compose.yml

# Step 5: Adapt for your project
# - Copy generated files to your project
# - Adjust ports, domain names
# - Use your .env.example format

# Step 6: Test locally
docker-compose up -d
# Verify: http://localhost:3000

# Step 7: Deploy
# Follow DOCKER_DEPLOYMENT.md guide

# Step 8: Add to team examples (optional)
mkdir .skills/examples/your-app-name
# Copy files, sanitize, commit
```

### 🔵 Setup for: Python + Django/Flask

```bash
# Step 1: Analyze
ls -la
# You should see: requirements.txt, manage.py (Django) or app.py (Flask)

# Step 2: Ask agent
"I have a Django app with PostgreSQL.
 Create deployment Docker setup."

# Step 3: Agent provides appropriate Python Dockerfile

# Step 4: Reference Python example
cat .skills/resources/dockerfile-python

# Step 5: Adapt and test locally
docker build -t my-app .
docker-compose up -d

# Step 6: Follow DOCKER_DEPLOYMENT.md
```

### 🟣 Setup for: Rails + React

```bash
# Step 1: Analyze
ls -la
# You should see: Gemfile, app/, config/

# Step 2: Ask agent
"Rails backend + React frontend deployment.
 Setup Docker and Nginx for VPS."

# Step 3: Reference similar example
cat .skills/examples/44-Mashraba-St/docker-compose.yml

# Step 4: Adapt to your project
# - Update database credentials
# - Adjust ports
# - Configure frontend URL

# Step 5: Deploy using guide
```

### 🟠 Setup for: Go Application

```bash
# Step 1: Analyze
ls -la
# You should see: go.mod, main.go

# Step 2: Ask agent
"Go application with PostgreSQL.
 Create Docker deployment setup."

# Step 3: Reference template
cat .skills/resources/dockerfile-go

# Step 4: Adapt for your project

# Step 5: Deploy
```

---

## Agent Usage in Workflow

### In Your Daily Development

#### Scenario 1: Starting a New Project
```bash
# Day 1 - Project Setup
You: "I'm starting a new [framework] project. 
     What should my tech stack look like?"
Agent: Uses planning skill
Result: Project structure, tech decisions

# Day 2 - Development
You: "Setup local development with Docker"
Agent: Creates docker-compose.yml
Result: docker-compose up -d works locally

# Week 4 - Deploy
You: "Create production deployment setup"
Agent: Uses deployment skill
Result: Complete Docker + Nginx setup
```

#### Scenario 2: During Code Review
```bash
Reviewer: "Can you check error handling here?"

Developer: "Agent, review this error handling 
            against best practices"
Agent: Uses error-handling-patterns skill
Result: Suggestions for improvement

# Fix, re-review, merge
```

#### Scenario 3: Sprint Planning
```bash
Team lead: "Plan Q2 release timeline"
Agent: Uses planning skill
Result: Timeline, milestones, tasks

# Team reviews and adjusts
```

### Integration Checkpoints

**Checkpoint 1: Before Starting Development**
```bash
[ ] Team has read QUICK_REFERENCE.md
[ ] Everyone can access skills repository
[ ] One test question asked by each person
```

**Checkpoint 2: Before First Deployment**
```bash
[ ] PROJECT_TECH_STACK.md created
[ ] SKILLS_MAPPING.md created
[ ] Relevant example referenced
[ ] Files tested locally
```

**Checkpoint 3: After First Production Deploy**
```bash
[ ] Deployment successful
[ ] Added to team examples (if different)
[ ] Documented in SKILLS_DECISIONS.md
[ ] Team trained on maintenance
```

---

## Team Contribution Workflow

### Contributing Your Deployment

**Goal:** Share your working deployment with the team

```
Step 1: Deployment Works (30 min)
┌─────────────────────────────────────┐
│ Your app deployed to production     │
│ Docker + Nginx working perfectly    │
└─────────────────────────────────────┘

Step 2: Sanitize Files (15 min)
┌─────────────────────────────────────┐
│ Remove real passwords               │
│ Replace domains with placeholders   │
│ Remove API keys                     │
│ Replace secrets with examples       │
└─────────────────────────────────────┘

Step 3: Create Folder (5 min)
┌─────────────────────────────────────┐
│ mkdir .skills/examples/your-app/    │
│ Copy files there                    │
└─────────────────────────────────────┘

Step 4: Write README (10 min)
┌─────────────────────────────────────┐
│ Document your tech stack            │
│ Explain setup                       │
│ Note any special requirements       │
└─────────────────────────────────────┘

Step 5: Commit & Push (2 min)
┌─────────────────────────────────────┐
│ git add .skills/examples/your-app/  │
│ git commit -m "Add your-app example"│
│ git push                            │
└─────────────────────────────────────┘

Step 6: Update Team (1 min)
┌─────────────────────────────────────┐
│ Update .skills/examples/README.md   │
│ Add your example to the list        │
│ Announce in #agent-skills-help      │
└─────────────────────────────────────┘

RESULT: Team has new reference! ✅
```

### Git Workflow for Skills

```bash
# Standard workflow for skills repository

# 1. Make changes
cd .skills
nano skills/deployment-skill/examples/your-app/README.md

# 2. Check what changed
git status
git diff

# 3. Commit
git add skills/deployment-skill/examples/your-app/
git commit -m "Add your-app deployment example

- Framework: [your-framework]
- Database: [your-db]
- Status: Production-tested

Resolves: #42 (if applicable)"

# 4. Push
git push origin main

# 5. Announce to team
# Share in Slack #agent-skills-help
```

---

## Troubleshooting

### Issue 1: "Agent doesn't recognize deployment questions"

**Cause:** Keywords not matching skill description  
**Solution:**
```bash
# Check what skill description includes
cat skills/deployment-skill/SKILL.md
# Look for: Docker, Nginx, deployment, containerization, etc.

# Try more specific keywords:
✅ "Deploy my Node.js app with Docker"
✅ "Create docker-compose for my project"
❌ "Help me with my app"
```

**Fix:** Use keywords from skill description

---

### Issue 2: "We don't have a similar example"

**Cause:** Your tech stack isn't in examples yet  
**Solution:**
```bash
# Ask agent to create from scratch
"I have [your tech stack] - create Docker deployment"

# Then add your working example
mkdir skills/deployment-skill/examples/your-app
# Add files, commit, share
```

---

### Issue 3: "Team members can't access the skills"

**Cause:** Repository not properly cloned/shared  
**Solution:**
```bash
# Verify access:
ls -la .skills/
# Should show: skills/, README.md, SETUP.md, etc.

# If missing, clone:
git clone <skills-repo-url> .skills

# Or add as submodule:
git submodule add <skills-repo-url> .skills
git submodule update --init --recursive
```

---

### Issue 4: "Skills folder is getting uncommitted changes"

**Problem:** Team members modifying shared resources accidentally

**Solution:**
```bash
# If using as submodule:
cd .skills
git checkout main  # Reset to latest

# If using as folder:
# Create .gitignore for personal experiments
.skills/personal-experiments/
.skills/*/temp/
```

**Better:** Create separate branch for your examples
```bash
git checkout -b company-examples
# Make changes
git push origin company-examples
# Create PR for review before merging
```

---

### Issue 5: "Someone committed sensitive data"

**IMPORTANT:** Immediately remove from history
```bash
# Option 1: Before pushing (quickest)
git reset --soft HEAD~1  # Undo last commit
# Remove sensitive data
git add [safe-files-only]
git commit -m "Remove sensitive data"
git push

# Option 2: Already pushed (use git-filter-repo)
# Following GitHub's removal guide
# OR create new branch without the file

# Reminder: Never commit:
# .env (only .env.example)
# config with secrets
# certificates
# API keys
```

---

## ✅ Integration Checklist

### Phase 1: Initial Setup
- [ ] Repository cloned/forked
- [ ] Documentation accessible to team
- [ ] QUICK_REFERENCE.md bookmarked
- [ ] Team meeting scheduled/completed

### Phase 2: First Use
- [ ] Team reads QUICK_REFERENCE.md
- [ ] Each person asks agent one question
- [ ] Agent skills activate successfully
- [ ] Results are helpful

### Phase 3: Project Integration
- [ ] PROJECT_TECH_STACK.md created
- [ ] SKILLS_MAPPING.md created
- [ ] Relevant examples referenced
- [ ] Development guide updated

### Phase 4: First Deployment
- [ ] Used skill for deployment help
- [ ] Files generated/customized
- [ ] Tested locally
- [ ] Deployed successfully

### Phase 5: Contribution
- [ ] Example added to team folder
- [ ] Sensitive data sanitized
- [ ] README written
- [ ] Committed and shared

### Phase 6: Ongoing
- [ ] Team uses skills regularly
- [ ] New examples added
- [ ] Skills documentation updated
- [ ] New team members trained

---

## 📞 Quick Help

**Q: Where do I start?**  
A: Read QUICK_REFERENCE.md first (everyone)

**Q: How do I ask the agent?**  
A: Just ask naturally about your task (e.g., "Deploy my app")

**Q: Where's my tech stack example?**  
A: Check skills/deployment-skill/examples/

**Q: How do I add my deployment?**  
A: Read "Team Contribution Workflow" section above

**Q: What if skills don't activate?**  
A: Use keywords from the skill description

**Q: Who do I ask for help?**  
A: Check Slack #agent-skills-help or ask tech lead

---

## 🎯 Success Metrics

After integration, you should:

✅ Team knows about available skills  
✅ Agent activates skills automatically  
✅ Deployments use consistent setup  
✅ New examples added regularly  
✅ Team training is self-serve  
✅ Onboarding new people is easy  

---

## 📅 Timeline Example

```
Week 1:
- Monday: Distribute skills repository
- Tuesday: Team reads documentation
- Wednesday: Team meeting demo
- Thursday: First questions asked
- Friday: Review and celebrate

Week 2-4:
- Use skills regularly
- Add team/company examples
- Refine processes
- Train new team members

Ongoing:
- Contribute deployments
- Update examples
- Share best practices
```

---

**Ready to integrate?**  
1. Print this guide
2. Share QUICK_REFERENCE.md
3. Start asking agent questions
4. Let skills enhance your workflow!

---

*Last Updated: March 6, 2026*
