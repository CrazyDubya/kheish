# Kheish Demo Showcase

This directory contains comprehensive demonstrations of Kheish's capabilities across different use cases and industries.

## Available Demos

### 1. Smart Code Assistant
**Path**: `smart-code-assistant/`
**Focus**: Comprehensive code analysis and security auditing

**What it demonstrates**:
- Multi-module integration (fs, sh, rag, http, memories)
- Security vulnerability detection
- Code quality assessment
- Build and test analysis
- Dependency security review
- Documentation evaluation

**Best for**: Software development teams, security auditors, DevOps engineers

---

### 2. Digital Detective
**Path**: `digital-detective/`
**Focus**: AI-powered digital investigation and threat intelligence

**What it demonstrates**:
- Online information gathering with http module
- Pattern analysis using RAG for correlation
- Professional intelligence reporting
- Ethical investigation methodology
- Multi-source verification

**Best for**: Cybersecurity professionals, threat analysts, researchers

---

### 3. Interactive Learning Assistant
**Path**: `learning-assistant/`
**Focus**: Personalized educational content creation

**What it demonstrates**:
- Educational content generation
- Code example validation
- Progressive learning design
- Interactive exercise creation
- Assessment tool development

**Best for**: Educators, training departments, technical writers

---

### 4. Weather Blog Post (Original)
**Path**: `weather-blog-post/`
**Focus**: Simple API integration and content creation

**What it demonstrates**:
- Basic HTTP API usage
- Content generation
- Simple agent workflow

**Best for**: Learning Kheish basics, content creators

---

### 5. Code Audit (Original)
**Path**: `audit-code/`
**Focus**: Security-focused code analysis

**What it demonstrates**:
- Filesystem analysis
- RAG-powered code indexing
- Security vulnerability detection

**Best for**: Security teams, code reviewers

## Running the Demos

### Prerequisites
1. **Set up environment variables**:
   ```bash
   export OPENAI_API_KEY="your-api-key-here"
   # Optional: for other providers
   export ANTHROPIC_API_KEY="your-anthropic-key"
   export DEEPSEEK_API_KEY="your-deepseek-key"
   ```

2. **Build Kheish**:
   ```bash
   cargo build --release
   ```

### Running Individual Demos

Choose any demo and run:
```bash
# Smart Code Assistant
./target/release/kheish --task-config examples/tasks/smart-code-assistant/task.yaml

# Digital Detective
./target/release/kheish --task-config examples/tasks/digital-detective/task.yaml

# Learning Assistant
./target/release/kheish --task-config examples/tasks/learning-assistant/task.yaml

# Weather Blog (original)
./target/release/kheish --task-config examples/tasks/weather-blog-post/task.yaml

# Code Audit (original)
./target/release/kheish --task-config examples/tasks/audit-code/task.yaml
```

### With API Server
Run any demo with the API server enabled:
```bash
./target/release/kheish --task-config examples/tasks/smart-code-assistant/task.yaml --api-enabled --api-port 3000
```

## Demo Complexity Levels

### Beginner (Start Here)
- **Weather Blog Post**: Simple API integration and content generation
- Basic agent workflow demonstration

### Intermediate
- **Code Audit**: File analysis and security scanning
- **Learning Assistant**: Educational content creation with validation

### Advanced
- **Smart Code Assistant**: Multi-module integration and comprehensive analysis
- **Digital Detective**: Complex investigation workflows with correlation

## Output Locations

All demos generate their output in the `exports/` directory:
- `exports/smart-code-analysis-report.md`
- `exports/digital-detective-investigation.md`
- `exports/rust-advanced-learning-module.md`
- `exports/paris-weather-blogpost.md`
- `exports/audit-report.md`

## Module Coverage Matrix

| Demo | fs | sh | rag | http | memories | ssh |
|------|----|----|-----|------|----------|-----|
| Smart Code Assistant | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ |
| Digital Detective | ❌ | ✅ | ✅ | ✅ | ✅ | ❌ |
| Learning Assistant | ✅ | ✅ | ✅ | ❌ | ✅ | ❌ |
| Weather Blog | ❌ | ✅ | ❌ | ❌ | ❌ | ❌ |
| Code Audit | ✅ | ❌ | ✅ | ❌ | ❌ | ❌ |

## Agent Workflow Patterns

All demos demonstrate the complete agent collaboration pattern:
1. **Proposer**: Creates initial analysis/content
2. **Reviewer**: Evaluates and requests improvements
3. **Validator**: Ensures quality and accuracy
4. **Formatter**: Produces final polished output

## Customization Guide

Each demo can be customized by modifying:

- **Agent prompts**: Adjust the focus and methodology
- **Module configurations**: Change allowed commands or settings
- **Workflow**: Modify the agent interaction pattern
- **Output format**: Change report structure and style
- **Context**: Adapt for different domains or use cases

## Contributing New Demos

To add a new demo:

1. Create a new directory under `examples/tasks/`
2. Add `task.yaml` with your agent configuration
3. Include a `README.md` explaining the demo
4. Update this index file
5. Test thoroughly with different scenarios

## Support and Troubleshooting

- Check the `logs/` directory for detailed execution logs
- Verify your API keys are correctly set
- Ensure all required dependencies are installed
- Review the agent prompts if outputs don't meet expectations

These demos showcase Kheish's versatility and power for building sophisticated AI agent systems across different domains and use cases.