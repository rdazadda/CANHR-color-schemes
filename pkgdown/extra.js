// Put a small color chip in front of every hex code shown in a table.
document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll("main table td code").forEach(function (code) {
    var hex = code.textContent.trim();
    if (!/^#[0-9A-Fa-f]{6}$/.test(hex)) return;

    var chip = document.createElement("span");
    chip.className = "chip";
    chip.style.backgroundColor = hex;
    chip.setAttribute("aria-hidden", "true");
    code.parentNode.insertBefore(chip, code);
  });
});
