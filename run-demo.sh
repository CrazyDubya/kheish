#!/bin/bash

# Kheish Demo Runner
# Interactive script to run and explore Kheish demos

set -euo pipefail

echo "🚀 Kheish Demo Runner"
echo "===================="
echo ""

# Check if we're in the right directory
if [ ! -f "Cargo.toml" ] || [ ! -f "validate-demos.sh" ]; then
    echo "❌ Please run this script from the Kheish root directory"
    exit 1
fi

# Check for API key
if [ -z "${OPENAI_API_KEY:-}" ]; then
    echo "⚠️  Warning: OPENAI_API_KEY not set"
    echo "   Set it with: export OPENAI_API_KEY=\"your-key-here\""
    echo ""
fi

# Build if needed
if [ ! -f "target/release/kheish" ]; then
    echo "🔨 Building Kheish (first time setup)..."
    cargo build --release --quiet
    echo "✅ Build complete!"
    echo ""
fi

# Demo options
echo "📋 Available Demos:"
echo ""
echo "1. 🔬 Smart Code Assistant (Comprehensive - All Modules)"
echo "   └─ Complete code analysis with security, quality, and documentation review"
echo ""
echo "2. 🕵️  Digital Detective (Investigation & Intelligence)"  
echo "   └─ AI-powered online investigation and threat intelligence gathering"
echo ""
echo "3. 📚 Learning Assistant (Educational Content Creation)"
echo "   └─ Interactive learning module creation with examples and assessments"
echo ""
echo "4. 🌤️  Weather Blog Post (Simple - Good for First Time)"
echo "   └─ API integration with creative content generation"
echo ""
echo "5. 🔒 Code Audit (Security Focus)"
echo "   └─ Security-focused codebase analysis and vulnerability detection"
echo ""
echo "6. 📖 View Demo Documentation"
echo ""
echo "7. ✅ Validate All Demos"
echo ""

# Get user choice
while true; do
    read -p "Choose a demo (1-7) or 'q' to quit: " choice
    
    case $choice in
        1)
            echo ""
            echo "🔬 Running Smart Code Assistant..."
            echo "This demo analyzes the current codebase comprehensively."
            echo "Expected runtime: 3-5 minutes"
            echo ""
            read -p "Continue? (y/N): " confirm
            if [[ $confirm =~ ^[Yy]$ ]]; then
                echo "▶️  Starting Smart Code Assistant..."
                ./target/release/kheish --task-config examples/tasks/smart-code-assistant/task.yaml
                echo ""
                echo "📄 Report generated: exports/smart-code-analysis-report.md"
            fi
            break
            ;;
        2)
            echo ""
            echo "🕵️ Running Digital Detective..."
            echo "This demo investigates AI/ML security trends online."
            echo "Expected runtime: 2-4 minutes"
            echo ""
            read -p "Continue? (y/N): " confirm
            if [[ $confirm =~ ^[Yy]$ ]]; then
                echo "▶️  Starting Digital Detective investigation..."
                ./target/release/kheish --task-config examples/tasks/digital-detective/task.yaml
                echo ""
                echo "📄 Report generated: exports/digital-detective-investigation.md"
            fi
            break
            ;;
        3)
            echo ""
            echo "📚 Running Learning Assistant..."
            echo "This demo creates an advanced Rust programming learning module."
            echo "Expected runtime: 2-3 minutes"
            echo ""
            read -p "Continue? (y/N): " confirm
            if [[ $confirm =~ ^[Yy]$ ]]; then
                echo "▶️  Starting Learning Assistant..."
                ./target/release/kheish --task-config examples/tasks/learning-assistant/task.yaml
                echo ""
                echo "📄 Learning module generated: exports/rust-advanced-learning-module.md"
            fi
            break
            ;;
        4)
            echo ""
            echo "🌤️ Running Weather Blog Post..."
            echo "This demo fetches weather data and creates a humorous blog post."
            echo "Expected runtime: 1-2 minutes"
            echo ""
            read -p "Continue? (y/N): " confirm
            if [[ $confirm =~ ^[Yy]$ ]]; then
                echo "▶️  Starting Weather Blog Post..."
                ./target/release/kheish --task-config examples/tasks/weather-blog-post/task.yaml
                echo ""
                echo "📄 Blog post generated: exports/paris-weather-blogpost.md"
            fi
            break
            ;;
        5)
            echo ""
            echo "🔒 Running Code Audit..."
            echo "This demo performs security analysis of the codebase."
            echo "Expected runtime: 2-4 minutes"
            echo ""
            read -p "Continue? (y/N): " confirm
            if [[ $confirm =~ ^[Yy]$ ]]; then
                echo "▶️  Starting Code Audit..."
                ./target/release/kheish --task-config examples/tasks/audit-code/task.yaml
                echo ""
                echo "📄 Audit report generated: exports/audit-report.md"
            fi
            break
            ;;
        6)
            echo ""
            echo "📖 Opening demo documentation..."
            if command -v less >/dev/null 2>&1; then
                less examples/tasks/README.md
            else
                cat examples/tasks/README.md
            fi
            echo ""
            ;;
        7)
            echo ""
            echo "✅ Running demo validation..."
            ./validate-demos.sh
            echo ""
            ;;
        q|Q)
            echo ""
            echo "👋 Thanks for exploring Kheish demos!"
            exit 0
            ;;
        *)
            echo "❌ Invalid choice. Please enter 1-7 or 'q'"
            ;;
    esac
done

echo ""
echo "🎉 Demo completed successfully!"
echo ""
echo "💡 What to do next:"
echo "   • Check the generated report in the exports/ directory"
echo "   • Explore other demos by running this script again"  
echo "   • Read examples/tasks/README.md for customization options"
echo "   • Visit the GitHub repository for more information"
echo ""
echo "🔧 Want to customize?"
echo "   • Modify the YAML files in examples/tasks/"
echo "   • Adjust agent prompts for different analysis styles"
echo "   • Configure different LLM models or providers"
echo ""
echo "✨ Happy exploring with Kheish!"