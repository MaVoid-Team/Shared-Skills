import pathlib
import zipfile

root = pathlib.Path('Agent-Skills')
out = pathlib.Path('Manus-Skills')
out.mkdir(exist_ok=True)

skill_dirs = sorted({p.parent for p in root.rglob('SKILL.md')})

created = []
for skill_dir in skill_dirs:
    skill_name = skill_dir.name
    zip_path = out / f"{skill_name}.skill"
    with zipfile.ZipFile(zip_path, 'w', compression=zipfile.ZIP_DEFLATED) as z:
        for path in skill_dir.rglob('*'):
            if path.is_dir():
                continue
            if any(part.startswith('__MACOSX') for part in path.parts):
                continue
            if path.name == '.DS_Store':
                continue
            rel = path.relative_to(skill_dir)
            arcname = pathlib.Path(skill_name) / rel
            z.write(path, arcname.as_posix())
    created.append(str(zip_path))

print(f"Created {len(created)} Manus .skill packages in {out}/ (sample: {created[:5]})")
