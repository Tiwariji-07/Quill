"""
Visual card: Gemini Flash and cost per completed task.
Run: python assets/diagrams/2026-05-20-gemini-flash-cost-per-task.py
Output: assets/diagrams/2026-05-20-gemini-flash-cost-per-task.png
"""

from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


OUT = Path(__file__).with_suffix(".png")
W, H = 1200, 627

BG = "#0B1020"
PANEL = "#121A2E"
PANEL_2 = "#101827"
BORDER = "#24314F"
TEXT = "#F5F7FB"
MUTED = "#AAB6D3"
BLUE = "#73A7FF"
GREEN = "#79E2B6"
YELLOW = "#FFD166"


def font(size: int, bold: bool = False) -> ImageFont.FreeTypeFont:
    candidates = [
        "/System/Library/Fonts/Supplemental/Arial Bold.ttf" if bold else "/System/Library/Fonts/Supplemental/Arial.ttf",
        "/Library/Fonts/Arial Bold.ttf" if bold else "/Library/Fonts/Arial.ttf",
        "/System/Library/Fonts/SFNS.ttf",
        "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf" if bold else "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
    ]
    for path in candidates:
        try:
            return ImageFont.truetype(path, size)
        except OSError:
            continue
    return ImageFont.load_default()


def rounded(draw: ImageDraw.ImageDraw, box, radius, fill, outline=None, width=1):
    draw.rounded_rectangle(box, radius=radius, fill=fill, outline=outline, width=width)


def bullet(draw: ImageDraw.ImageDraw, x: int, y: int, text: str, accent: str):
    draw.ellipse((x, y + 8, x + 10, y + 18), fill=accent)
    draw.text((x + 24, y), text, font=font(27), fill=TEXT)


img = Image.new("RGB", (W, H), BG)
draw = ImageDraw.Draw(img)

# Soft background accents.
draw.ellipse((-180, -160, 360, 360), fill="#13234A")
draw.ellipse((880, 390, 1350, 810), fill="#14372F")

margin = 64
draw.text((margin, 48), "Fast per token is not fast per task", font=font(48, True), fill=TEXT)
draw.text(
    (margin, 112),
    "For coding agents, the unit is completed work.",
    font=font(27),
    fill=MUTED,
)

left = (margin, 176, 568, 466)
right = (632, 176, W - margin, 466)
rounded(draw, left, 28, PANEL, BORDER, 2)
rounded(draw, right, 28, PANEL_2, BORDER, 2)

draw.text((left[0] + 36, left[1] + 34), "Token-level benchmark", font=font(31, True), fill=BLUE)
for idx, item in enumerate(["tokens/sec", "latency", "price per 1M tokens", "looks fast"]):
    bullet(draw, left[0] + 42, left[1] + 94 + idx * 44, item, BLUE)

draw.text((right[0] + 36, right[1] + 34), "Agent task reality", font=font(31, True), fill=GREEN)
for idx, item in enumerate(["planning tokens", "tool retries", "context recovery", "bad diff correction"]):
    bullet(draw, right[0] + 42, right[1] + 94 + idx * 44, item, GREEN)

rounded(draw, (margin, 500, W - margin, 572), 22, "#171F34", "#2E3D61", 2)
draw.text(
    (margin + 34, 518),
    "Measure cost per merged diff, not streamed tokens.",
    font=font(34, True),
    fill=YELLOW,
)

img.save(OUT, "PNG", optimize=True)
print(OUT)
