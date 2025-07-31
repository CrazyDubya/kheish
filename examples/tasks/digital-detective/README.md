# Digital Detective Demo

This demo showcases Kheish's ability to act as an intelligent digital investigator that gathers, analyzes, and correlates information from multiple online sources.

## What This Demo Does

The Digital Detective conducts comprehensive investigations by:

- **Information Gathering**: Systematically collecting data from multiple online sources
- **Pattern Analysis**: Identifying trends, connections, and anomalies in collected data
- **Cross-Referencing**: Using RAG to find relationships between different pieces of information
- **Risk Assessment**: Evaluating security implications and potential threats
- **Professional Reporting**: Creating detailed investigation reports with evidence and recommendations

## Modules Demonstrated

This demo highlights specific Kheish capabilities:

1. **`http` (HTTP Client)**: Fetches information from web sources and APIs
2. **`rag` (Retrieval-Augmented Generation)**: Stores and cross-references collected intelligence
3. **`memories` (Memory)**: Maintains investigation context across agent interactions
4. **`sh` (Shell)**: Runs network analysis tools like `curl`, `dig`, `whois` when needed

## Investigation Focus

The demo investigates: **Recent AI/ML security vulnerabilities and trends**

This includes:
- Recent security incidents in AI/ML systems
- Emerging attack patterns and threat vectors
- Defensive measures and best practices
- Timeline of significant security events
- Risk assessment for current threat landscape

## Agent Workflow

The investigation follows a professional methodology:

1. **Proposer (Investigator)**: Gathers information systematically from multiple sources
2. **Reviewer (Analyst)**: Evaluates findings for accuracy and credibility
3. **Validator (Quality Assurance)**: Ensures ethical standards and factual accuracy
4. **Formatter (Intelligence Officer)**: Creates professional investigation report

## Running the Demo

1. **Set up environment**:
   ```bash
   export OPENAI_API_KEY="your-api-key-here"
   ```

2. **Run the investigation**:
   ```bash
   cargo run --release -- --task-config examples/tasks/digital-detective/task.yaml
   ```

3. **Review results**: Investigation report generated at `exports/digital-detective-investigation.md`

## Expected Output

The demo produces a professional intelligence report featuring:

- **Executive Summary**: Key findings and implications
- **Methodology**: Investigation approach and source evaluation
- **Timeline**: Chronological sequence of security events
- **Pattern Analysis**: Trends and connections in threat landscape
- **Risk Assessment**: Current and emerging security risks
- **Recommendations**: Actionable defensive measures
- **Evidence Documentation**: Properly attributed sources and findings

## Demo Highlights

This demonstration showcases:

- **Real-world application**: Practical cybersecurity intelligence gathering
- **Multi-source correlation**: RAG-powered information synthesis
- **Ethical investigation**: Responsible use of publicly available information
- **Professional output**: Intelligence-grade reporting standards
- **Agent specialization**: Each agent contributes unique expertise
- **Quality assurance**: Multi-stage review and validation process

## Customization Options

The investigation can be adapted for different scenarios:

- **Investigation topics**: Change focus to different security domains
- **Source types**: Modify HTTP requests for different data sources
- **Analysis depth**: Adjust agent prompts for varying levels of detail
- **Output format**: Customize report structure and formatting
- **Tool access**: Configure different shell commands for investigation tools

This demonstrates Kheish's versatility for intelligence gathering and analysis tasks.