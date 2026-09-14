# PDF build evidence

[current-build.json](current-build.json) binds the current 168-page PDF to its
manuscript inputs and completed clean build. [layout-review.json](layout-review.json)
records rendered page inspection, link checks, page bounds, typography and
visual review. [reproduction.json](reproduction.json) records the clean
reproduction check. The title page displays the title, author contact details
and date of 14 September 2026.
The reproduction record also reports an actual negative check: supplying an
optional `tex-text.tec` presence fixture caused the public build command to
reject that environment before typesetting.

[environment.json](environment.json) records the exact executable hashes and
183 loaded TeX resources, including package and font files. The public setup
also requires the `tex-text.tec` font mapping to be absent; its observed absence
is recorded in the same environment file. The setup
is in [PUBLICATION.md](../../PUBLICATION.md); every build uses a fresh private
format and preserves diagnostics. The [engine logs](logs/pass-1.log) and
[format log](logs/format.log) retain TeX diagnostics with local paths replaced
as described in [PUBLIC-COPY.md](../PUBLIC-COPY.md).
[heading-destinations.json](heading-destinations.json) records all 132 explicit
heading targets checked against bookmark pages and heights. All 48 Lean line
links are checked against their intended declarations or contract fields.
Every target also clears the rendered heading text by at least six points,
so following a link keeps the heading's first line visible.
