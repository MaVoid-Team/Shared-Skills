import pathlib
import json

base = pathlib.Path('Agent-Skills')
changed = []

for path in base.rglob('*.copy.md'):
    text = path.read_text(encoding='utf-8')
    # Parse YAML frontmatter if present
    meta = {}
    body = text
    if text.startswith('---\n'):
        parts = text.split('---\n', 2)
        if len(parts) >= 3:
            raw_meta = parts[1]
            body = parts[2].lstrip('\n')
            for line in raw_meta.splitlines():
                if not line.strip() or line.strip().startswith('#'):
                    continue
                if ':' in line:
                    key, val = line.split(':', 1)
                    meta[key.strip()] = val.strip().strip('"').strip("'")

    name = path.stem.replace('.copy', '')
    skill = {
        'type': 'antigravity-skill',
        'name': name,
        'description': meta.get('description', '').strip(),
        'argumentHint': meta.get('argument-hint', meta.get('argumentHint', '')).strip(),
        'sourceFile': str(path),
        'content': body.strip() + "\n",
    }

    out_path = path.with_name(f"{path.stem.replace('.copy', '')}.skill")
    out_path.write_text(json.dumps(skill, indent=2, ensure_ascii=False) + "\n", encoding='utf-8')
    changed.append(str(out_path))

print(f"Converted {len(changed)} files to .skill (sample: {changed[:5]})")
