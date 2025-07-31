# Smart Code Assistant Demo

This demo showcases the full capabilities of Kheish through a comprehensive code analysis assistant that demonstrates all major modules and agent roles working together.

## What This Demo Does

The Smart Code Assistant performs a complete analysis of a codebase, including:

- **Security Analysis**: Identifies vulnerabilities and security risks
- **Code Quality Assessment**: Evaluates code structure, maintainability, and best practices
- **Build & Test Analysis**: Runs tests, checks build health, identifies gaps
- **Dependency Review**: Analyzes dependencies for security issues and updates
- **Documentation Evaluation**: Reviews and suggests documentation improvements
- **Performance Analysis**: Identifies potential bottlenecks and optimizations

## Modules Demonstrated

This demo showcases all major Kheish modules:

1. **`fs` (Filesystem)**: Reads and analyzes code files across the repository
2. **`sh` (Shell)**: Runs build tools, tests, linters, and other commands
3. **`rag` (Retrieval-Augmented Generation)**: Indexes code for semantic search and analysis
4. **`http` (HTTP Client)**: Checks external resources for dependency information
5. **`memories` (Memory)**: Stores analysis results across agent iterations

## Agent Workflow Demonstrated

The demo shows the complete agent collaboration workflow:

1. **Proposer**: Performs comprehensive analysis using all modules
2. **Reviewer**: Evaluates the analysis for completeness and accuracy
3. **Validator**: Ensures the analysis meets professional standards
4. **Formatter**: Creates a polished, professional report

## Running the Demo

1. **Prerequisites**: Ensure you have an OpenAI API key set in your environment:
   ```bash
   export OPENAI_API_KEY="your-api-key-here"
   ```

2. **Run the assistant**:
   ```bash
   cargo run --release -- --task-config examples/tasks/smart-code-assistant/task.yaml
   ```

3. **View the results**: The analysis report will be generated at `exports/smart-code-analysis-report.md`

## Expected Output

The demo generates a comprehensive markdown report including:

- Executive summary of key findings
- Detailed security analysis with vulnerability reports
- Code quality assessment with improvement recommendations
- Build and test status evaluation
- Dependency analysis with security recommendations
- Documentation review and suggestions
- Performance optimization opportunities
- Prioritized action items for improvement

## Demo Features Highlighted

This demo specifically demonstrates:

- **Multi-module integration**: All modules work together seamlessly
- **Agent collaboration**: Multiple agents review and refine the analysis
- **RAG capabilities**: Large codebase indexing and semantic search
- **Practical output**: Actionable, professional-quality analysis report
- **Error handling**: Robust handling of various code analysis scenarios
- **Workflow management**: Complex multi-step agent workflows

## Customization

The task can be easily customized for different types of analysis:

- Modify `allowed_commands` in the `sh` module configuration
- Adjust agent prompts for different analysis focus areas
- Change the `base_path` to analyze different codebases
- Configure different LLM models or providers

This demonstrates Kheish's flexibility and configurability for various AI agent tasks.