"""Generates assets/icon/icon.png – white bg + red-gradient cruise-ship silhouette."""
import zlib, struct, math, os

def make_chunk(tag, data):
    c = tag + data
    return struct.pack(">I", len(data)) + c + struct.pack(">I", zlib.crc32(c) & 0xffffffff)

def make_png(w, h, get_pixel_fn):
    rows = []
    for y in range(h):
        row = bytearray([0])
        for x in range(w):
            r, g, b, a = get_pixel_fn(x, y, w, h)
            row += bytearray([r, g, b, a])
        rows.append(bytes(row))
    raw = b"".join(rows)
    sig = b"\x89PNG\r\n\x1a\n"
    ihdr = make_chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 6, 0, 0, 0))
    idat = make_chunk(b"IDAT", zlib.compress(raw, 9))
    iend = make_chunk(b"IEND", b"")
    return sig + ihdr + idat + iend

def get_pixel(x, y, w, h):
    cx, cy = w / 2.0, h / 2.0
    nx = (x - cx) / cx
    ny = (y - cy) / cy

    def in_rounded_rect(xn, yn, radius):
        ax, ay = abs(xn), abs(yn)
        inner = 1.0 - radius
        if ax <= inner or ay <= inner:
            return True
        dx, dy = ax - inner, ay - inner
        return math.sqrt(dx*dx + dy*dy) <= radius

    # Outer shape: rounded rect
    if not in_rounded_rect(nx, ny, 0.22):
        return (255, 255, 255, 255)

    # Vertical gradient: #CC0000 → #880000
    t = y / h
    grad_r = int(204 - t * 80)
    r_bg = max(100, grad_r)

    # Ship geometry (all in normalized -1..1 space)
    hcy = 0.22; hrx = 0.62; hry = 0.095
    hx = nx / hrx; hy = (ny - hcy) / hry
    in_hull = hx*hx + hy*hy <= 1.0
    # Bow taper (right)
    if nx >= 0.45 and not in_hull:
        prog = (nx - 0.45) / 0.23
        half = hry * max(0.0, 1.0 - prog)
        if abs(ny - hcy) <= half:
            in_hull = True

    in_deck1 = (abs(nx) <= 0.46 and -0.10 <= ny <= 0.12)
    in_deck2 = (abs(nx) <= 0.30 and -0.28 <= ny <= -0.08)
    in_deck3 = (abs(nx) <= 0.16 and -0.44 <= ny <= -0.24)
    in_bridge = (abs(nx) <= 0.09 and -0.56 <= ny <= -0.40)
    in_f1 = (abs(nx + 0.05) <= 0.032 and -0.66 <= ny <= -0.50)
    in_f2 = (abs(nx - 0.05) <= 0.032 and -0.66 <= ny <= -0.50)
    in_waves = False
    if 0.30 <= ny <= 0.36:
        wave = math.sin(nx * 7 * math.pi) * 0.025
        in_waves = abs(ny - 0.33 - wave) <= 0.028 and abs(nx) <= 0.78

    in_ship = in_hull or in_deck1 or in_deck2 or in_deck3 or in_bridge or in_f1 or in_f2 or in_waves
    if in_ship:
        return (255, 255, 255, 255)
    return (r_bg, 0, 0, 255)

if __name__ == "__main__":
    os.makedirs("assets/icon", exist_ok=True)
    SIZE = 1024
    data = make_png(SIZE, SIZE, get_pixel)
    path = "assets/icon/icon.png"
    with open(path, "wb") as f:
        f.write(data)
    print(f"Icon written: {path} ({len(data):,} bytes)")
