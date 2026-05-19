"""
Chart: 6-year total cost of ownership across LLM access paths
Data source: Kale Bryce's Code YouTube analysis (https://www.youtube.com/watch?v=SmYNK0kqaDI)
  - $200/mo subscription * 72 months = $14,400
  - NeoCloud H100 @ $2.20/hr, 8hrs/day weekdays = $27,456 over 6yrs
  - NeoCloud H100 @ $2.20/hr, 24/7 = $38,544 over 6yrs (uses 365.25 days)
  - Self-host 1x H100: $30,000 card + ~$3,700 power (350W, $0.20/kWh, 24/7) + ~$3,700 cooling (PUE 2.0) ~= $37,400
  - DGX H100 (8x H100) self-host total cost of ownership ~= $400,000

Run: python3 assets/charts/2026-05-19-open-weight-llm-6yr-tco.py
"""
import matplotlib.pyplot as plt
import matplotlib.ticker as mtick

labels = [
    "Subscription\n($200/mo)",
    "Rent 1x H100\n(weekdays, 8h/day)",
    "Rent 1x H100\n(24/7)",
    "Own 1x H100\n(card + power + cooling)",
    "Own DGX H100\n(8x H100, full TCO)",
]
costs = [14_400, 27_456, 38_544, 37_400, 400_000]

# color: subscription baseline green, self-host paths red-shifted
colors = ["#2ecc71", "#e67e22", "#e67e22", "#c0392b", "#7b0a0a"]

fig, ax = plt.subplots(figsize=(12, 6.27))
bars = ax.bar(labels, costs, color=colors, edgecolor="#222", linewidth=0.6)

ax.set_title(
    "6-year cost of running a state-of-the-art LLM, one user",
    fontsize=15, fontweight="bold", pad=14, loc="left",
)
ax.set_ylabel("Total cost over 6 years (USD)", fontsize=11)
ax.yaxis.set_major_formatter(mtick.FuncFormatter(lambda x, _: f"${int(x/1000)}K"))
ax.set_ylim(0, 450_000)

# value labels on top of each bar
for bar, cost in zip(bars, costs):
    ax.text(
        bar.get_x() + bar.get_width() / 2,
        bar.get_height() + 6_000,
        f"${cost:,.0f}",
        ha="center", va="bottom", fontsize=10, fontweight="bold",
    )

# subtle annotation: where the subscription line sits
ax.axhline(14_400, color="#2ecc71", linestyle="--", linewidth=1, alpha=0.5)
ax.text(
    4.45, 18_000, "subscription baseline",
    color="#2ecc71", fontsize=9, ha="right", style="italic",
)

# clean up chrome
ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)
ax.tick_params(axis="x", labelsize=10)
ax.grid(axis="y", linestyle=":", alpha=0.3)

# footer note
fig.text(
    0.01, 0.01,
    "Source: Kale Bryce's Code (YouTube). H100 retail $30K. NeoCloud $2.20/hr. "
    "DGX H100 TCO ~$400K assumes Michigan grid power + PUE 2.0 cooling over 6yrs.",
    fontsize=7.5, color="#666",
)

plt.tight_layout(rect=[0, 0.03, 1, 1])
plt.savefig(
    "assets/charts/2026-05-19-open-weight-llm-6yr-tco.png",
    dpi=150, bbox_inches="tight",
)
print("saved assets/charts/2026-05-19-open-weight-llm-6yr-tco.png")
