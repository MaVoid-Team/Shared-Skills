# 🎯 Skills Quick Reference Card

Print this out or bookmark it! Your quick guide to available skills and how to use them.

---

## 🎯 What Are Skills?

**Skills** = domain-specific knowledge that the agent automatically uses when you mention related keywords.

**How:** Just ask naturally about your task. Keywords trigger the right skill.

```
You: "Create Docker config for my Node app"
      ↓
Agent detects keywords: Docker, Node, config
      ↓
Agent activates deployment-skill
      ↓
You get complete Docker setup help ✓
```

---

## 📚 Available Skills & Trigger Words

### 🐳 **Deployment-Documentation**
*Docker • Nginx • VPS • Infrastructure • Container*

```
Ask about:
- "Deploy app to VPS"
- "Create Docker setup"
- "Setup Nginx reverse proxy"
- "SSL certificates"
- "Docker-compose"
- "Dockerize my app"

Get:
✓ Dockerfile
✓ docker-compose.yml
✓ Nginx config
✓ Deployment guide
✓ Setup script
```

**Learn More:** [TEAM_GUIDE.md](skills/deployment-skill/TEAM_GUIDE.md)  
**Examples:** 4 production deployments

---

### 📋 **Planning**
*Roadmap • Strategy • Timeline • Sprint • Priority*

```
Ask about:
- "Plan my project"
- "Create timeline"
- "Organize backlog"
- "Strategic roadmap"

Get:
✓ Project structure
✓ Timelines
✓ Milestones
✓ Prioritization
```

**Learn More:** [skills/planning/README.md](skills/planning/README.md)

---

### 🛡️ **Error-Handling-Patterns**
*Debug • Error handling • Exception • Validation • Crash*

```
Ask about:
- "How to handle errors?"
- "Debug this issue"
- "Error strategy"
- "Fault tolerance"

Get:
✓ Error patterns
✓ Debugging guides
✓ Resilience strategies
✓ Best practices
```

**Learn More:** [skills/error-handling-patterns/README.md](skills/error-handling-patterns/README.md)

---

### 🔨 **Creating-Skills**
*Custom skill • Build agent • Extend knowledge*

```
Ask about:
- "Create a custom skill"
- "Build knowledge module"
- "Extend agent"

Get:
✓ Skill structure
✓ YAML template
✓ Best practices
✓ Examples
```

**Learn More:** [skills/creating-skills/README.md](skills/creating-skills/README.md)

---

### 🎨 **Brand-Identity**
*Branding • Design tokens • Voice and tone • Style guide*

```
Ask about:
- "Brand guidelines"
- "Design tokens"
- "Voice and tone"
- "Visual identity"

Get:
✓ Brand standards
✓ Design system
✓ Communication style
✓ Asset guidelines
```

**Learn More:** [skills/brand-identity/README.md](skills/brand-identity/README.md)

---

### 💡 **Brainstorming**
*Ideate • Creative • Generate ideas • Innovation*

```
Ask about:
- "Brainstorm ideas"
- "Solve this problem"
- "Generate solutions"
- "Creative approaches"

Get:
✓ Idea generation
✓ Problem solutions
✓ Innovative approaches
✓ Alternative views
```

**Learn More:** [skills/brainstorming/README.md](skills/brainstorming/README.md)

---

### 🧵 **Stitch-Design-Skills**
*Design • UI/UX • Stitch • Screen • Mockup*

```
Ask about:
- "Design a checkout page"
- "Create .stitch/DESIGN.md"
- "Enhance this UI prompt"
- "Generate React components"
- "Edit this screen with Stitch"

Get:
✓ High-fidelity UI
✓ Professional prompts
✓ Design system docs
✓ Downloaded assets
✓ Component code
```

**Learn More:** [Agent-Skills/Stitch-Skills/README.md](Agent-Skills/Stitch-Skills/README.md)

---

## ⚡ Quick Examples

### Deploy My App (5 seconds)
```
You: "I have a Node.js app and want to deploy to VPS 
      with Docker and Nginx. Help me?"

Agent automatically uses deployment-skill:
✓ Asks about your stack
✓ Creates docker-compose.yml
✓ Sets up Nginx config
✓ Provides deployment guide
```

### Reference Real Example (2 seconds)
```
You: "Show me a real deployment example 
      similar to my Next.js + Node setup"

Agent points to: examples/Al-Atmor/
✓ Complete working files
✓ Real production config
✓ Setup walkthrough
```

### Plan Your Project (3 seconds)
```
You: "Help me plan my new feature release"

Agent activates planning-skill:
✓ Organizes timeline
✓ Defines milestones
✓ Prioritizes tasks
✓ Creates roadmap
```

---

## 📁 Important Folders

```
deployment-skill/
├── TEAM_GUIDE.md ← START HERE for deployment
├── SKILL.md ← What agent reads
├── examples/ ← Real working deployments
│   ├── 44-Mashraba-St/ (Rails + React)
│   ├── Al-Atmor/ (Next.js + Node)
│   ├── El-Hassan-Glasses/ (MERN)
│   └── Sinai-Vibes/ (React + Rails)
└── resources/ ← Reusable templates
    ├── docker-compose-template.yml
    ├── dockerfile-nodejs
    └── nginx-config-template.conf
```

---

## 🎓 Learning Path

### Day 1 (15 min)
- [ ] Read root README.md
- [ ] Read TEAM_GUIDE.md for deployment-skill
- [ ] Ask agent 1 deployment question

### Day 2-3 (30 min)
- [ ] Browse examples/ folder
- [ ] Read STRUCTURE.md
- [ ] Ask agent 3+ questions
- [ ] Check resource templates

### Day 4+ (ongoing)
- [ ] Use skills regularly
- [ ] Add your own examples
- [ ] Contribute to team
- [ ] Create custom skills

---

## 🔑 Pro Tips

### Tip 1: Be Specific
```
❌ "How do I deploy?"
✅ "Deploy my Next.js app with Docker and PostgreSQL to VPS"
```

### Tip 2: Reference Examples
```
"Show me how 44-Mashraba-St deployment works"
→ Agent shows real production example
```

### Tip 3: Mix Skills
```
"Plan deployment for my Node app and create Docker setup"
→ Agent uses both planning + deployment skills
```

### Tip 4: Save Good Answers
```
When agent gives good config:
1. Copy the output
2. Add to examples/ folder
3. Share with team
4. Update examples/README.md
```

---

## 🆘 Troubleshooting

### Skill Not Activating?
**Try:** Use keywords from skill description  
**Or:** Be more specific about what you need  
**Or:** Ask agent "What deployment files do I need?"

### Can't Find Example?
**Check:** examples/ folder in deployment-skill  
**Or:** Read examples/README.md for how to add one  
**Or:** Ask agent "Similar to [tech-stack]?"

### Need Different Tech Stack?
**Check:** resources/ folder for templates  
**Or:** Ask agent to adapt an example  
**Or:** Read creating-skills to build custom skill

---

## 🚀 Workflow Examples

### Scenario 1: Deploy First App
```
1. Ask: "Create Docker setup for Django + PostgreSQL"
   → Get: docker-compose.yml, Dockerfile, Nginx config
2. Ask: "Step-by-step deployment to VPS?"
   → Get: Complete guide with commands
3. Ask: "How do I manage this later?"
   → Get: Maintenance and troubleshooting guide
```

### Scenario 2: Learn from Examples
```
1. Browse: examples/El-Hassan-Glasses (MERN stack)
2. Ask: "Adapt this for my tech stack"
   → Get: Customized configuration
3. Deploy using provided files
4. Add your deployment to team examples
```

### Scenario 3: Team Collaboration
```
1. Team lead: Shares SETUP.md with team
2. Everyone: Clones repository
3. Team: Uses deployment skill together
4. Team: Adds company examples
5. Team: References shared deployments
```

---

## 📞 Need Help?

| Question | Answer |
|----------|--------|
| How do I use deployment skill? | Read [TEAM_GUIDE.md](skills/deployment-skill/TEAM_GUIDE.md) |
| Where are examples? | Look in [examples/](skills/deployment-skill/examples/) |
| Technical details? | See [STRUCTURE.md](skills/deployment-skill/STRUCTURE.md) |
| How to share with team? | Follow [SETUP.md](SETUP.md) |
| Want to create a skill? | Read [creating-skills/SKILL.md](skills/creating-skills/SKILL.md) |

---

## 🛑 Remember

- ✅ Skills activate **automatically** - just ask naturally
- ✅ Keywords **determine** which skill activates
- ✅ **Examples** are your friends - reference them!
- ✅ **Templates** save time - use and customize them
- ✅ **Share** your deployments - add to examples!
- ✅ **Customize** keywords - make them your own

---

## 📍 You Are Here

```
Start → This card → Full README.md → TEAM_GUIDE.md → Examples/Resources
```

**Next Step:** Ask your agent about what you need to build!

---

**Bookmark this card!** | **Share with your team!** | **Questions?** Check README.md

---

*Last Updated: March 6, 2026*  
*Print this | Bookmark this | Share this*
