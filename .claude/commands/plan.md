# Create GitHub Issue

## Introduction

Transform feature descriptions, bug reports, or improvement ideas into well-structured GitHub issues that follow project conventions and best practices. This command provides flexible detail levels to match your needs.

## Prerequisites

- GitHub CLI (`gh`) installed and authenticated
- Access to the target repository
- Understanding of the feature/bug/improvement to document

## Feature Description

<feature_description> #$ARGUMENTS </feature_description>

## Main Tasks

### 1. Repository Research & Context Gathering

<thinking>
First, I need to understand the project's conventions and existing patterns, leveraging all available resources
</thinking>

**Internal Repository Research:**

- [ ] Examine repository structure and architecture files (`ARCHITECTURE.md`, `README.md`, `CONTRIBUTING.md`)
- [ ] Analyze existing GitHub issues for formatting patterns and label usage
- [ ] Review project documentation for issue submission guidelines
- [ ] Check for issue templates in `.github/ISSUE_TEMPLATE/`
- [ ] Search codebase for relevant implementation patterns using `ast-grep` or `rg`

**External Best Practices Research:**

- [ ] Use Context7 MCP to pull in GitHub best practices documentation
- [ ] Search web for issue creation best practices specific to the technology stack
- [ ] Find examples of well-written issues in similar open source projects
- [ ] Research domain-specific terminology and conventions

**Framework & Library Documentation:**

- [ ] Use Context7 to fetch relevant framework/library documentation
- [ ] Identify version-specific best practices and constraints
- [ ] Note any deprecations or upcoming changes that might affect the issue

**Reference Collection:**

- [ ] Document all research findings with specific file paths (e.g., `app/services/example_service.rb:42`)
- [ ] Include URLs to external documentation and best practices guides
- [ ] Create a reference list of similar issues or PRs (e.g., `#123`, `#456`)
- [ ] Note any team conventions discovered in `CLAUDE.md` or team documentation

### 2. Issue Planning & Structure

<thinking>
Think like a product manager - what would make this issue clear and actionable? Consider multiple perspectives
</thinking>

**Title & Categorization:**

- [ ] Draft clear, searchable issue title using conventional format (e.g., `feat:`, `fix:`, `docs:`)
- [ ] Identify appropriate labels from repository's label set (`gh label list`)
- [ ] Determine issue type: enhancement, bug, documentation, refactor
- [ ] Consider adding priority labels if available (P0, P1, P2 or critical, high, medium, low)

**Stakeholder Analysis:**

- [ ] Identify who will be affected by this issue (end users, developers, operations)
- [ ] Consider implementation complexity and required expertise
- [ ] Estimate effort using team's preferred scale (story points, t-shirt sizes, hours)
- [ ] Note any cross-team dependencies or coordination needs

**Content Planning:**

- [ ] Choose appropriate detail level based on issue complexity and audience
- [ ] List all necessary sections for the chosen template
- [ ] Gather supporting materials (error logs, screenshots, design mockups)
- [ ] Prepare code examples or reproduction steps if applicable

### 3. Choose Implementation Detail Level

Select how comprehensive you want the issue to be:

#### 📄 MINIMAL (Quick Issue)

**Best for:** Simple bugs, small improvements, clear features

**Includes:**

- Problem statement or feature description
- Basic acceptance criteria
- Essential context only

**Structure:**

```markdown
## Description

[Brief problem/feature description]

## Acceptance Criteria

- [ ] Core requirement 1
- [ ] Core requirement 2

## Context

[Any critical information]

## References

- Related issue: #[issue_number]
- Documentation: [relevant_docs_url]
```

#### 📋 MORE (Standard Issue)

**Best for:** Most features, complex bugs, team collaboration

**Includes everything from MINIMAL plus:**

- Detailed background and motivation
- Technical considerations
- Success metrics
- Dependencies and risks
- Basic implementation suggestions

**Structure:**

```markdown
## Overview

[Comprehensive description]

## Problem Statement / Motivation

[Why this matters]

## Proposed Solution

[High-level approach]

## Technical Considerations

- Architecture impacts
- Performance implications
- Security considerations

## Acceptance Criteria

- [ ] Detailed requirement 1
- [ ] Detailed requirement 2
- [ ] Testing requirements

## Success Metrics

[How we measure success]

## Dependencies & Risks

[What could block or complicate this]

## References & Research

- Similar implementations: [file_path:line_number]
- Best practices: [documentation_url]
- Related PRs: #[pr_number]
```

#### 📚 A LOT (Comprehensive Issue)

**Best for:** Major features, architectural changes, complex integrations

**Includes everything from MORE plus:**

- Detailed implementation plan with phases
- Alternative approaches considered
- Extensive technical specifications
- Resource requirements and timeline
- Future considerations and extensibility
- Risk mitigation strategies
- Documentation requirements

**Structure:**

```markdown
## Overview

[Executive summary]

## Problem Statement

[Detailed problem analysis]

## Proposed Solution

[Comprehensive solution design]

## Technical Approach

### Architecture

[Detailed technical design]

### Implementation Phases

#### Phase 1: [Foundation]

- Tasks and deliverables
- Success criteria
- Estimated effort

#### Phase 2: [Core Implementation]

- Tasks and deliverables
- Success criteria
- Estimated effort

#### Phase 3: [Polish & Optimization]

- Tasks and deliverables
- Success criteria
- Estimated effort

## Alternative Approaches Considered

[Other solutions evaluated and why rejected]

## Acceptance Criteria

### Functional Requirements

- [ ] Detailed functional criteria

### Non-Functional Requirements

- [ ] Performance targets
- [ ] Security requirements
- [ ] Accessibility standards

### Quality Gates

- [ ] Test coverage requirements
- [ ] Documentation completeness
- [ ] Code review approval

## Success Metrics

[Detailed KPIs and measurement methods]

## Dependencies & Prerequisites

[Detailed dependency analysis]

## Risk Analysis & Mitigation

[Comprehensive risk assessment]

## Resource Requirements

[Team, time, infrastructure needs]

## Future Considerations

[Extensibility and long-term vision]

## Documentation Plan

[What docs need updating]

## References & Research

### Internal References

- Architecture decisions: [file_path:line_number]
- Similar features: [file_path:line_number]
- Configuration: [file_path:line_number]

### External References

- Framework documentation: [url]
- Best practices guide: [url]
- Industry standards: [url]

### Related Work

- Previous PRs: #[pr_numbers]
- Related issues: #[issue_numbers]
- Design documents: [links]
```

### 4. Issue Creation & Formatting

<thinking>
Apply best practices for clarity and actionability, making the issue easy to scan and understand
</thinking>

**Content Formatting:**

- [ ] Use clear, descriptive headings with proper hierarchy (##, ###)
- [ ] Include code examples in triple backticks with language syntax highlighting
- [ ] Add screenshots/mockups if UI-related (drag & drop or use image hosting)
- [ ] Use task lists (- [ ]) for trackable items that can be checked off
- [ ] Add collapsible sections for lengthy logs or optional details using `<details>` tags
- [ ] Apply appropriate emoji for visual scanning (🐛 bug, ✨ feature, 📚 docs, ♻️ refactor)

**Cross-Referencing:**

- [ ] Link to related issues/PRs using #number format
- [ ] Reference specific commits with SHA hashes when relevant
- [ ] Link to code using GitHub's permalink feature (press 'y' for permanent link)
- [ ] Mention relevant team members with @username if needed
- [ ] Add links to external resources with descriptive text

**Code & Examples:**

```markdown
# Good example with syntax highlighting and line references

\`\`\`ruby

# app/services/user_service.rb:42

def process_user(user)

# Implementation here

end \`\`\`

# Collapsible error logs

<details>
<summary>Full error stacktrace</summary>

\`\`\` Error details here... \`\`\`

</details>
```

**AI-Era Considerations:**

- [ ] Account for accelerated development with AI pair programming
- [ ] Include prompts or instructions that worked well during research
- [ ] Note which AI tools were used for initial exploration (Claude, Copilot, etc.)
- [ ] Emphasize comprehensive testing given rapid implementation
- [ ] Document any AI-generated code that needs human review

### 5. Final Review & Submission

**Pre-submission Checklist:**

- [ ] Title is searchable and descriptive
- [ ] Labels accurately categorize the issue
- [ ] All template sections are complete
- [ ] Links and references are working
- [ ] Acceptance criteria are measurable

## Output Format

Present the complete issue content within `<github_issue>` tags, ready for GitHub CLI:

```bash
gh issue create --title "[TITLE]" --body "[CONTENT]" --label "[LABELS]"
```

## Thinking Approaches

- **Analytical:** Break down complex features into manageable components
- **User-Centric:** Consider end-user impact and experience
- **Technical:** Evaluate implementation complexity and architecture fit
- **Strategic:** Align with project goals and roadmap

## Notes

**Issue Quality Guidelines:**

- Prioritize clarity over completeness - a clear MINIMAL issue beats a confusing comprehensive one
- Consider your audience: maintainers need different details than contributors
- Write for future you - include context you'll forget in 6 months
- Make issues self-contained - minimize need to reference external discussions

**Research Integration:**

- Always include specific file paths and line numbers when referencing code
- Link to the exact version of external documentation (include version numbers)
- When using Context7, note which library version was referenced
- Save important web search results as quotes in the issue (pages may change)

**Continuous Improvement:**

- Update CLAUDE.md with any new patterns discovered during research
- Document effective prompts that yielded good results
- Note any project-specific conventions not yet documented
- Share learnings from AI-assisted research in team channels

**Modern Development Considerations:**

- AI tools enable faster implementation but require more thorough testing
- Include AI-friendly descriptions that can be used as prompts
- Document which parts were AI-generated vs human-written
- Consider adding "AI implementation notes" section for complex features

## Expected Outcome

A well-structured GitHub issue that:

- Clearly communicates the need
- Provides appropriate detail for the chosen level
- Follows project conventions
- Enables efficient implementation
- Facilitates team collaboration
