---
name: skill-import-workflow
description: Guidance for importing skills from an online repository and converting them into Manus-compatible .skill packages. Includes metadata validation and packaging steps. Use for: (add when to use this skill in your project).
---

# Skill Import Workflow

This skill teaches you how to **import skills from a remote Git repository**, make them **Manus-compatible**, and **validate/update metadata** so Manus can reliably trigger them.

## When to use this skill

Use this when you want to:

- Pull skill content from an external repo (e.g., GitHub) without creating submodules.
- Convert plain markdown-based skills into **Manus .skill packages** (zip archives with a root folder).
- Ensure every skill has proper **YAML frontmatter metadata** (`name`, `description`, and a `Use for:` clause).

## Workflow Overview

1. **Clone the source repository** (or otherwise fetch skill files).
2. **Copy the desired skill markdown files** into a local skill folder.
3. **Normalize/validate metadata**, ensuring each skill has:
   - `name:` (human-friendly skill name)
   - `description:` (what it does and when to use it)
   - A **`Use for:` clause** in the description (helps Manus trigger correctly)
4. **Package each skill** into a `.skill` file:
   - Each `.skill` is a ZIP archive.
   - The archive MUST contain `SKILL.md` at the archive root.
   - Do **not** nest `SKILL.md` under a subfolder (Manus will reject it).
5. **Verify the result** by inspecting the `.skill` archive structure and by checking metadata.

---

## Manus Compatibility Checklist (Required)

Use this checklist every time before upload:

1. `SKILL.md` begins with YAML frontmatter delimited by `---`.
2. YAML includes at minimum:
   - `name:`
   - `description:`
3. Description includes a `Use for:` clause.
4. Save file as UTF-8 (avoid mojibake/garbled symbols).
5. Package as `.skill` (zip format) with **root-level** `SKILL.md`.
6. Open the archive and confirm entry is exactly `SKILL.md` (no parent folder path).
7. If using folder-based naming conventions, align `name:` with destination folder naming rules.

### Fast Validation Command (PowerShell)

```powershell
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::OpenRead("path/to/file.skill").Entries | Select-Object FullName,Length
```

Expected output for Manus upload should include:

```text
SKILL.md
```

If you see `SomeFolder/SKILL.md`, repack the archive.

---

## Included Scripts

### `scripts/import_skills_from_repo.ps1`

A PowerShell script that:

1. Clones a git repo (or updates it).
2. Copies markdown skill files from the specified path.
3. Normalizes YAML metadata.
4. Generates Manus-compatible `.skill` packages with `SKILL.md` at archive root.

### `scripts/validate_skill_metadata.ps1`

Validates that every `SKILL.md` in a folder:
- Has `name:` and `description:` in the YAML frontmatter.
- Includes a `Use for:` clause in the description.

---

## How to Run (example)

```powershell
# 1) Import skills from a remote repo and package into .skill files
.
\scripts\import_skills_from_repo.ps1 \
  -RepoUrl "https://github.com/msitarzewski/agency-agents.git" \
  -RepoSubpath "marketing" \
  -DestSkillsDir "Agent-Skills/Marketing-Skills" \
  -VerboseOutput

# 2) Validate metadata (optional / safe to run repeatedly)
\scripts\validate_skill_metadata.ps1 -Folder "Agent-Skills/Marketing-Skills" -Fix -Verbose
```

