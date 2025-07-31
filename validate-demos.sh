#!/bin/bash

# Demo validation script for Kheish
# This script validates that all demo YAML configurations are valid

set -e

echo "🔍 Kheish Demo Validation Script"
echo "================================="

# Ensure we're in the right directory
cd "$(dirname "$0")"

# Build Kheish first
echo "🔨 Building Kheish..."
cargo build --release --quiet

# Define demo tasks
DEMOS=(
    "examples/tasks/smart-code-assistant/task.yaml"
    "examples/tasks/digital-detective/task.yaml"
    "examples/tasks/learning-assistant/task.yaml"
    "examples/tasks/weather-blog-post/task.yaml"
    "examples/tasks/audit-code/task.yaml"
)

echo ""
echo "📋 Validating demo configurations..."

# Validate each demo YAML syntax
for demo in "${DEMOS[@]}"; do
    if [ -f "$demo" ]; then
        echo -n "  ✅ $demo ... "
        # Use basic YAML syntax check
        if python3 -c "import yaml; yaml.safe_load(open('$demo'))" 2>/dev/null; then
            echo "VALID"
        else
            echo "❌ INVALID YAML syntax"
            exit 1
        fi
    else
        echo "  ❌ $demo ... FILE NOT FOUND"
        exit 1
    fi
done

echo ""
echo "📁 Checking demo structure..."

# Check if each demo has required files
for demo_dir in examples/tasks/*/; do
    demo_name=$(basename "$demo_dir")
    echo -n "  📂 $demo_name ... "
    
    required_files=("task.yaml")
    has_readme=false
    
    for file in "${required_files[@]}"; do
        if [ ! -f "$demo_dir/$file" ]; then
            echo "❌ Missing $file"
            exit 1
        fi
    done
    
    if [ -f "$demo_dir/README.md" ]; then
        has_readme=true
    fi
    
    if $has_readme; then
        echo "✅ Complete (with README)"
    else
        echo "⚠️  Missing README.md"
    fi
done

echo ""
echo "🎯 Demo Configuration Analysis"
echo "=============================="

# Analyze module usage across demos
echo "📊 Module usage across demos:"
echo "  Module     | Smart | Detective | Learning | Weather | Audit"
echo "  -----------|-------|-----------|----------|---------|-------"

modules=("fs" "sh" "rag" "http" "memories" "ssh")
for module in "${modules[@]}"; do
    printf "  %-10s |" "$module"
    for demo in "${DEMOS[@]}"; do
        if grep -q "name: \"$module\"" "$demo" 2>/dev/null; then
            printf "   ✅   |"
        else
            printf "   ❌   |"
        fi
    done
    echo ""
done

echo ""
echo "🔧 Configuration Quality Checks"
echo "==============================="

# Check for common configuration issues
issues_found=0

for demo in "${DEMOS[@]}"; do
    demo_name=$(basename "$(dirname "$demo")")
    echo "🔍 Checking $demo_name..."
    
    # Check if LLM model is specified
    if ! grep -q "llm_model:" "$demo"; then
        echo "  ⚠️  No LLM model specified"
        ((issues_found++))
    fi
    
    # Check if LLM provider is specified
    if ! grep -q "llm_provider:" "$demo"; then
        echo "  ⚠️  No LLM provider specified"
        ((issues_found++))
    fi
    
    # Check if output file is specified
    if ! grep -q "file:" "$demo"; then
        echo "  ⚠️  No output file specified"
        ((issues_found++))
    fi
    
    # Check if all agents have system_prompt
    agents=$(grep -c "system_prompt:" "$demo" || echo "0")
    if [ "$agents" -eq 0 ]; then
        echo "  ⚠️  No agent system prompts found"
        ((issues_found++))
    fi
done

echo ""
if [ $issues_found -eq 0 ]; then
    echo "✅ All demos passed validation!"
    echo ""
    echo "🚀 Ready to run demos:"
    echo "   cargo run --release -- --task-config examples/tasks/smart-code-assistant/task.yaml"
    echo "   cargo run --release -- --task-config examples/tasks/digital-detective/task.yaml"
    echo "   cargo run --release -- --task-config examples/tasks/learning-assistant/task.yaml"
    echo ""
    echo "📖 See examples/tasks/README.md for detailed instructions"
else
    echo "⚠️  Found $issues_found configuration issues (warnings only)"
fi

echo ""
echo "✨ Validation complete!"