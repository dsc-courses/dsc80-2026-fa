# Repository Guidelines

## Project Structure & Module Organization

This repository hosts the DSC 80 course website and instructional materials.
- Root Markdown files such as `syllabus.md`, `calendar.md`, and `resources.md` define website pages.
- `_modules/week-XX.md` defines weekly schedules; `_staffers/` and `_staffersnobio/` hold staff profiles.
- `_layouts/`, `_includes/`, `_sass/`, and `assets/` contain Jekyll templates, styles, and shared assets. `_config.yml` controls site settings.
- `lectures/lecXX/`, `discussions/weekN/`, `labs/lab01/`, and `projects/proj01/` contain notebooks, Python helpers, and assignment data. `proj04/` contains final-project guidance; `resources/` holds published course resources.

## Build, Test, and Development Commands

Run website commands from the repository root:
- `bundle install`: install Ruby dependencies from `Gemfile` and `Gemfile.lock`.
- `bundle exec make serve`: start Jekyll with automatic rebuilds.
- `bundle exec make build`: generate the website in `_site/`.
- `make clean`: remove generated site and cache directories.

Restart the server after changing `_config.yml`. Check its `baseurl` when previewing pages. The configuration currently includes Spring 2026 metadata and links; verify term-specific values when updating Fall content.

## Coding Style & Naming Conventions

Preserve Markdown YAML front matter and existing collection fields. Match surrounding YAML indentation, use four spaces for Python indentation, and retain snake_case function names. Follow existing directory patterns such as `lec01` and `week-01.md`. Keep notebook edits focused and avoid unrelated output changes. No repository-wide formatter or linter configuration is provided.

## Testing Guidelines

Assignments use Otter Grader. With notebook dependencies installed, run `python lab-validation.py all` from `labs/lab01/` or `python project-validation.py all` from `projects/proj01/`. Notebook checks use question identifiers such as `q1`; discussion tests include `tests/q2.py`. Preserve validation scripts marked “Do NOT edit.” Starter functions may be incomplete, so interpret failures accordingly. No coverage threshold is configured.

For website changes, build and inspect affected pages, navigation, images, and links locally.

## Commit & Pull Request Guidelines

History uses short descriptive subjects, such as `update staff info`; no formal commit prefix convention is established. Keep commits focused. In pull requests, describe affected pages or assignments, list validation performed, link relevant issues, and include screenshots for visible layout changes. Review staged files explicitly: `make push` stages everything, commits, pulls, and pushes to `gh-pages`.
