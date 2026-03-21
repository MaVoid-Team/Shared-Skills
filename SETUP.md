# Antigravity Skills Setup Guide

Welcome! This guide helps you set up and use these agent skills with your team.

## 📦 What You're Installing

This is a collection of **Agent Skills** for Antigravity — domain-specific knowledge modules that activate automatically when the agent detects relevant keywords.

### Available Skills

1. **Deployment Documentation** → Docker, Nginx, VPS deployment
2. **Planning** → Project planning, strategy
3. **Error Handling Patterns** → Error management, debugging
4. **Creating Skills** → Custom skill development
5. **Brand Identity** → Branding guidelines, style guides
6. **Brainstorming** → Creative ideation, problem-solving

## 🚀 Quick Start (5 minutes)

### For Individual Use

1. **Clone this repository** to your local machine:
   ```bash
   git clone <repository-url>
   cd default-agent-skills
   ```

2. **Link it to Antigravity** (how you integrate with your agent):
   ```
   [Follow your Antigravity setup process]
   ```

3. **Start asking the agent!**
   ```
   "I need to deploy my Node.js app with Docker and Nginx"
   → Automatically uses deployment skill
   ```

### For Team Setup

1. **Share the repository link** with your team
2. **Each team member**: Fork or clone the repo
3. **Point to SETUP.md** for one-time setup
4. **Reference TEAM_GUIDE in deployment-skill** for usage

## 📁 Repository Structure

```
default-agent-skills/
├── README.md           # Overview of all skills
├── SETUP.md           # This file
│
└── skills/
    ├── deployment-skill/
    │   ├── SKILL.md                    ← Agent reads this
    │   ├── TEAM_GUIDE.md               ← Team documentation
    │   ├── README.md                   ← Feature overview
    │   ├── STRUCTURE.md                ← Technical details
    │   ├── resources/                  ← Reusable templates
    │   └── examples/                   ← Real working deployments
    │
    ├── planning/
    ├── error-handling-patterns/
    ├── creating-skills/
    ├── brand-identity/
    └── brainstorming/
```

## 🎯 How Skills Work

### Automatic Activation

Skills activate **automatically** when you mention related keywords:

```
User: "Create a Docker setup for my app"
     ↓
Agent detects deployment-related keywords
     ↓
Agent reads deployment-skill/SKILL.md
     ↓
Skill activates and helps you
```

### Keyword Detection

Each skill's `SKILL.md` contains a `description` field with trigger keywords:

```yaml
---
name: deployment-documentation
description: Docker, Nginx, deployment, VPS... [more keywords]
---
```

When you mention any of these keywords, the skill automatically activates.

## 📖 Reading Documentation

Start with these files in order:

1. **README.md** (root) → Overview of all skills
2. **TEAM_GUIDE.md** (deployment-skill) → How to use the deployment skill
3. **SKILL.md** (each skill) → Detailed instructions agent uses
4. **examples/** → Real working implementations
5. **resources/** → Reusable templates

## 💼 For Team Leads / Managers

### Distribution Steps

1. **Create a team repository** or shared folder
2. **Clone this repository into it**
3. **Make it accessible** to all team members
4. **Share this SETUP.md** as onboarding

### Team Best Practices

```
/team-resources/
├── default-agent-skills/          ← Main repo (keep updated)
│   ├── skills/
│   │   └── deployment-skill/
│   │       └── examples/
│   │           ├── 44-Mashraba-St/        ← Our deployments
│   │           └── custom-project/        ← Team additions
│   └── SETUP.md
│
└── TEAM_WORKFLOW.md               ← Your team's specific process
```

### Updating Team Skills

```bash
# Team lead periodically updates
cd default-agent-skills
git pull origin main

# Team members get updates
cd default-agent-skills
git pull origin main
```

## 🔧 Installation Verification

Check that skills are working:

### Test 1: Ask About Deployment
```
Ask agent: "What would deployment documentation include for a Node.js app?"

Expected result: Agent references the deployment skill and provides detailed answer
```

### Test 2: Ask About Error Handling
```
Ask agent: "How should I handle database connection errors?"

Expected result: Agent uses error-handling-patterns skill
```

### Test 3: Ask About Planning
```
Ask agent: "Help me plan a new feature rollout"

Expected result: Agent uses planning skill
```

If all three work, skills are properly integrated! ✅

## 🎓 Learning Path

### Week 1: Foundation
- [ ] Read root README.md
- [ ] Read TEAM_GUIDE.md for deployment-skill
- [ ] Ask agent 3+ deployment questions
- [ ] Browse examples folder

### Week 2: Going Deeper
- [ ] Read STRUCTURE.md for technical details
- [ ] Review resource templates
- [ ] Ask agent complex deployment questions
- [ ] Reference real examples from your stack

### Week 3: Contributing
- [ ] Plan your first deployment
- [ ] Add your example to examples/ folder
- [ ] Contribute new templates to resources/
- [ ] Share with team members

## 🤝 Contributing to Skills

### Adding a New Example

1. Navigate to `skills/deployment-skill/examples/`
2. Create folder: `your-app-name-deployment/`
3. Copy files from a similar example
4. Customize for your app
5. Sanitize all sensitive data
6. Update `examples/README.md`
7. Commit and push

### Creating a New Skill

1. Create new folder: `skills/your-skill-name/`
2. Create `SKILL.md` with YAML frontmatter
3. Add supporting docs and templates
4. Create examples if applicable
5. Reference in root README.md

See `skills/creating-skills/SKILL.md` for detailed instructions.

## ⚙️ Customization

### For Your Team

1. **Update skill descriptions** with your team's keywords
2. **Add company-specific examples** to examples/
3. **Include your tech stack** in templates
4. **Document your processes** in custom guides

### Example: Customizing Deployment Skill

Edit `skills/deployment-skill/SKILL.md`:

```yaml
---
name: deployment-documentation
description: [Add your team's specific keywords and tech stacks here]
---
```

This makes the skill trigger for terminology your team uses!

## 🔐 Security Considerations

### Protecting Sensitive Data

⚠️ **NEVER commit to version control:**
- Real API keys
- Database passwords
- Production domains
- Private certificates
- JWT secrets

✅ **Always use placeholders:**
```env
DATABASE_URL=postgresql://user:PASSWORD_HERE@host:5432/db
API_KEY=YOUR_API_KEY_HERE
DOMAIN=your-domain.com
```

### For Team Sharing

1. **Sanitize all files** before committing
2. **Use .env.example** only (never .env)
3. **Include comments** explaining each secret
4. **Document** where credentials go

## 🐛 Troubleshooting

### Skills Not Activating

**Problem:** I ask about deployment but the skill doesn't activate.

**Solution:**
1. Check keyword compatibility (use deployment-related terms)
2. Verify SKILL.md file is in correct location
3. Ensure agent has access to skills folder
4. Try being more specific with keywords

### Missing Templates

**Problem:** I can't find a Dockerfile for my tech stack.

**Solution:**
1. Check `resources/` folder for variations
2. Reference `examples/` for similar projects
3. Ask agent to create one based on examples
4. Contribute your version back!

### Questions About Usage

**Problem:** How do I reference this with my team?

**Solution:**
1. Share this SETUP.md file
2. Point to TEAM_GUIDE.md in deployment-skill
3. Have them clone the raw repo
4. Start using the skill together

## 📚 Additional Resources

- **SKILL.md files** - Where agent reads instructions
- **TEAM_GUIDE.md** - How your team uses the skill
- **README.md** (in each skill) - Feature overviews
- **examples/** - Real working deployments
- **resources/** - Reusable templates

## 🎯 Success Metrics

After setup, you should be able to:

- ✅ Ask agent about deployment and get detailed help
- ✅ Reference real examples for your tech stack
- ✅ Use templates for new projects
- ✅ Train team members using these materials
- ✅ Add new examples as you deploy projects

## 📞 Getting Help

| Question | Where to Look |
|----------|---------------|
| "How do I deploy?" | TEAM_GUIDE.md → deployment-skill |
| "Show me an example" | examples/ folder |
| "What's the technical detail?" | STRUCTURE.md |
| "How do I create templates?" | skills/creating-skills/SKILL.md |
| "What's available?" | Root README.md |

## 🚀 You're Ready!

1. ✅ Repository accessed
2. ✅ Structure understood  
3. ✅ Ready to start using skills

**Next Step:** Ask the agent about your first deployment!

---

**Last Updated:** March 6, 2026  
**Skills Available:** 6  
**Examples Included:** 4+ deployment examples  
**Ready for team use:** ✅
