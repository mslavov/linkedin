# LinkedIn Content Automation (Claude-powered)

## TL;DR

Automate LinkedIn post creation using GitHub issues as content triggers. Claude generates drafts that maintain story continuity across posts, presented as PRs for review. Approved posts are scheduled and published automatically. Built for personal brand consistency without manual overhead.

---

## Goals

### Business Goals
* Strengthen Milko's personal brand with consistent, high-quality LinkedIn content
* Increase posting frequency while maintaining authentic voice
* Build a content pipeline that scales without extra effort

### User Goals
* Create posts by simply opening GitHub issues
* Review and approve all content before publishing
* Maintain narrative continuity across posts
* Achieve steady posting cadence (1 post/day)

### Non-Goals
* Multi-user support or team workflows
* Other social platforms beyond LinkedIn
* Publishing without manual approval

---

## User Stories

**Persona: Milko (Solo Founder, Builder in Public)**

* As Milko, I want to create a GitHub issue to trigger post generation, so content creation fits my existing workflow
* As Milko, I want Claude to consider previous posts when writing drafts, so my content tells a coherent story
* As Milko, I want to review drafts as PRs before publishing, maintaining control over my brand
* As Milko, I want automated scheduling that respects my audience's attention

---

## Functional Requirements

### Content Trigger (Priority: High)
* GitHub issue creation triggers post generation workflow
* Issue title and body provide content direction
* Labels categorize post type (update, insight, tip, etc.)

### Story-Aware Generation (Priority: High)
* Claude reads recent posts from `history.md` to maintain narrative continuity
* References tone guidelines (`tone.md`) and best practices (`best-practices.md`)
* Generates contextually aware drafts that build on previous content

### Review Workflow (Priority: High)
* Each draft creates a PR with the generated post
* PR includes reasoning for narrative connections and timing
* Merge approval queues post for publishing

### Smart Scheduling (Priority: Medium)
* Maintains daily posting rhythm
* Prioritizes based on content type and urgency labels
* Respects optimal LinkedIn engagement windows

### LinkedIn Publishing (Priority: Medium)
* Automated posting via LinkedIn API
* Error handling with GitHub issue creation for failures
* Success confirmation in PR comments

---

## User Experience

### Core Workflow

1. **Content Initiation**
   - Create GitHub issue with post idea/topic
   - Add labels for priority/type (optional)

2. **Automated Generation**
   - GitHub Action triggers on issue creation
   - Claude reads context files and recent posts
   - Generates story-connected draft maintaining voice consistency

3. **Review Process**
   - Draft appears as PR linked to original issue
   - Includes narrative justification and suggested timing
   - Edit directly in PR or comment for changes

4. **Publishing Pipeline**
   - PR merge adds to posting queue
   - Scheduler posts at optimal time
   - Updates issue with published URL

### Configuration
* `tone.md` - Voice and style guidelines
* `best-practices.md` - Content strategies
* `history.md` - Recent posts for continuity
* `schedule.yml` - Posting preferences

---

## Technical Architecture

### GitHub Actions Workflow
```yaml
on:
  issues:
    types: [opened, labeled]
```
* Triggers Claude to generate contextual drafts
* Creates PRs with generated content
* Manages posting queue

### Integration Points
* **GitHub Issues** - Content trigger and tracking
* **Claude API** - Story-aware draft generation via MCP
* **LinkedIn API** - Scheduled publishing via MCP
* **GitHub Actions** - Workflow orchestration

### Data Flow
1. Issue → Claude (with context) → Draft PR
2. PR approval → Posting queue
3. Scheduler → LinkedIn API → Published post
4. Update issue with results

---

## Success Metrics

* Time from idea (issue) to published post
* Posting consistency (posts/week)
* PR approval rate without major edits
* Narrative coherence across post series

---

## Implementation Phases

### Phase 1: Issue-Triggered Generation (2 days)
* GitHub Action for issue → Claude workflow
* Basic draft generation with context files

### Phase 2: Story Continuity (2 days)
* Enhanced prompt engineering for narrative flow
* History analysis for topic threading

### Phase 3: Scheduling & Publishing (3 days)
* Queue management system
* LinkedIn API integration
* Error handling and notifications

### Phase 4: Polish (1 day)
* Documentation and setup guide
* Performance optimizations

**Total estimate: ~1 week**

---