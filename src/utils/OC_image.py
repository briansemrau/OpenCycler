#
# OpenCycler — combine multiple print files into a single automated plate-cycling run.
# Copyright (C) 2026  Aaron Chambers

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
from __future__ import annotations

import io

from PIL import Image

from OC_print_data import OC_PrintQueue


def generate_tile_thumbnail(print_queue: OC_PrintQueue) -> Image.Image | None:
    images: list[Image.Image] = []
    print(len(print_queue.prints))
    for print_item in print_queue.get_prints():
        raw_image = print_item.get_image()
        if not raw_image:
            continue
        try:
            with Image.open(io.BytesIO(raw_image)) as opened:
                print(f"appending image for {print_item.get_name()}")
                images.append(opened.copy())
        except OSError:
            continue
        if len(images) == 4:
            break

    if not images:
        return None

    if len(images) == 1:
        return images[0]

    def _center_crop(image: Image.Image, target_w: int, target_h: int) -> Image.Image:
        left = max((image.width - target_w) // 2, 0)
        upper = max((image.height - target_h) // 2, 0)
        right = left + target_w
        lower = upper + target_h
        return image.crop((left, upper, right, lower))

    if len(images) == 2:
        base_width = min(image.width for image in images)
        base_height = min(image.height for image in images)
        if base_width <= 0 or base_height <= 0:
            return None
        half_width = base_width // 2
        if half_width <= 0:
            return None
        canvas = Image.new("RGBA", (base_width, base_height), (0, 0, 0, 0))
        left_image = _center_crop(images[0], half_width, base_height).convert("RGBA")
        right_image = _center_crop(images[1], half_width, base_height).convert("RGBA")
        canvas.paste(left_image, (0, 0), left_image)
        canvas.paste(right_image, (half_width, 0), right_image)
        return canvas

    tile_width = min(image.width for image in images)
    tile_height = min(image.height for image in images)
    if tile_width <= 0 or tile_height <= 0:
        return None

    canvas = Image.new("RGBA", (tile_width * 2, tile_height * 2), (0, 0, 0, 0))
    positions = [
        (0, 0),
        (tile_width, 0),
        (0, tile_height),
        (tile_width, tile_height),
    ]

    for image, (x, y) in zip(images, positions):
        tile_image = image.convert("RGBA")
        tile_image.thumbnail((tile_width, tile_height), Image.Resampling.LANCZOS)
        offset_x = x + (tile_width - tile_image.width) // 2
        offset_y = y + (tile_height - tile_image.height) // 2
        canvas.paste(tile_image, (offset_x, offset_y), tile_image)

    return canvas
